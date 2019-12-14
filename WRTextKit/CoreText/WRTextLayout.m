//
//  WRTextLayout.m
//  WRTextKitDemo
//
//  Created by 项辉 on 2019/12/11.
//  Copyright © 2019 项辉. All rights reserved.
//

#import "WRTextLine.h"
#import "WRTextLayout.h"


@interface WRTextLayout()

@property (nonatomic, strong) NSMutableArray *textLines;

@property (nonatomic, readwrite) CTFramesetterRef ctFrameSetter;
@property (nonatomic, readwrite) CTFrameRef ctFrame;

@property (nonatomic, readwrite) CGSize bounds;


@end

@implementation WRTextLayout

- (instancetype)init {
    if (self = [super init]) {
        self.containerSize = CGSizeZero;
        self.vertical = YES;
        self.verticalAlignment = WRTextVerticalAlignmentLeading;
        self.horizontalAlignment = WRTextHorizontalAlignmentCenter;
        self.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return self;
}

- (void)setContainerSize:(CGSize)containerSize {
    if (CGSizeEqualToSize(containerSize, _containerSize)) {
        return;
    }
    self.bounds = containerSize;
    _containerSize = CGSizeMake(MAX(containerSize.width, containerSize.height), MAX(containerSize.width, containerSize.height));
    [self calculationcLayout];
}

- (void)setText:(NSAttributedString *)text {
    if ([_text isEqualToAttributedString:text]) return;
    _text = [[NSMutableAttributedString alloc] initWithAttributedString:text];
    [self calculationcLayout];
}

#pragma mark - Calculation
- (void)calculationcLayout {
    if (self.text.length == 0 || CGSizeEqualToSize(self.containerSize, CGSizeZero)) return;

    CGRect cgPathBox = CGRectMake(0, 0, _containerSize.width, _containerSize.height);
    CGRect pathRect = CGRectApplyAffineTransform(cgPathBox, CGAffineTransformMakeScale(1, -1));
    CGPathRef cgPath = CGPathCreateWithRect(pathRect, NULL);

    NSDictionary* frameAttrs = nil;
    if(self.vertical){
        frameAttrs = @{(NSString *)kCTFrameProgressionAttributeName:@(kCTFrameProgressionLeftToRight)};
    }
    CTFramesetterRef ctSetter= CTFramesetterCreateWithAttributedString((CFTypeRef)self.text);
    CTFrameRef ctFrame = CTFramesetterCreateFrame(ctSetter, CFRangeMake(0, 0), cgPath, (CFTypeRef)frameAttrs);
    self.textLines = [[NSMutableArray alloc] init];
    CFArrayRef ctLines = CTFrameGetLines(ctFrame);
    NSUInteger lineCount = CFArrayGetCount(ctLines);

    CGSize textBoundingSize = CGSizeZero;
    CGRect textBoundingRect = CGRectZero;

    CGPoint lineOrigins[lineCount];

    CTFrameGetLineOrigins(ctFrame, CFRangeMake(0, lineCount), lineOrigins);

    for (NSUInteger i = 0; i < lineCount;  i ++) {
        CTLineRef ctLine = CFArrayGetValueAtIndex(ctLines, i);
        CFArrayRef ctRuns = CTLineGetGlyphRuns(ctLine);
        
        if (!ctRuns || CFArrayGetCount(ctRuns) == 0)
            continue;
        ///the coordinate of CoreText
        CGPoint lineOrigin = lineOrigins[i];
        ///the coordinate of UIKit
        CGPoint position;
        position.x = cgPathBox.origin.x + lineOrigin.x;
        position.y = cgPathBox.size.height + cgPathBox.origin.y - lineOrigin.y;
        
        
        WRTextLine* foLine = [[WRTextLine alloc] initWithCTLine:ctLine position:position vertical:self.vertical];
        
        if (foLine.position.x + foLine.bounds.size.width > self.bounds.width) {
            NSInteger lastIndex = MAX(0, i - 1);
            if (lastIndex < 0) {
                break;
            }
            WRTextLine* lastLine = self.textLines[lastIndex];
            
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithAttributedString:_text];

            NSMutableParagraphStyle *paragraphStyle =  [[NSMutableParagraphStyle alloc] init];
            paragraphStyle.lineBreakMode = self.lineBreakMode;
            [string addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:lastLine.range];
            self.text = string;
            
            break;
        }
        
        [self.textLines addObject:foLine];
        if (i == 0)
            textBoundingRect = foLine.bounds;
        else
            textBoundingRect = CGRectUnion(textBoundingRect, foLine.bounds);
    }
    { // calculate bounding size
        CGRect rect = textBoundingRect;
        
        rect = CGRectStandardize(rect);
        CGSize size = rect.size;
        if (self.vertical) {
                        size.width += rect.origin.x;
//            size.width += cgPathBox.size.width - (rect.origin.x + rect.size.width);
        } else {
            size.width += rect.origin.x;
        }
        size.height += rect.origin.y;
        if (size.width < 0) size.width = 0;
        if (size.height < 0) size.height = 0;
        size.width = ceil(size.width);
        size.height = ceil(size.height);
        textBoundingSize = size;
    }
//    if(self.vertical){
//        ////// vertical text /////
//        NSCharacterSet *rotateCharset = FOTextVerticalRotateCharacterSet();
//        NSCharacterSet *rotateMoveCharset = FOTextVerticalRotateAndMoveCharacterSet();
//        
//        for (WRTextLine* line in self.textLines) {
//            [self handleVerticalLines:line rotateCharset:rotateCharset rotateMoveCharset:rotateMoveCharset];
//        }
//    }
    
    _textBoundingRect = textBoundingRect;
    _textBoundingSize = textBoundingSize;
    
    self.ctFrameSetter = ctSetter;
    self.ctFrame = ctFrame;
    
    CFRelease(cgPath);
    CFRelease(ctSetter);
    CFRelease(ctFrame);
    
}

#pragma mark - draw
- (void)drawInContext:(CGContextRef)context size:(CGSize)size{
    
    CGContextSaveGState(context);
    
    CGContextTranslateCTM(context, 0, size.height);
    CGContextScaleCTM(context, 1, -1);
    
    NSArray *lines = self.textLines;
    
    for (NSUInteger l = 0, lMax = lines.count; l < lMax; l++) {
        WRTextLine *line = lines[l];
        NSArray *lineRunRanges = line.verticalTextRange;
        CGFloat posX = line.position.x;
        
        CGFloat posY = size.height - line.position.y;
        CFArrayRef runs = CTLineGetGlyphRuns(line.ctLine);
        for (NSUInteger r = 0, rMax = CFArrayGetCount(runs); r < rMax; r++) {
            CTRunRef run = CFArrayGetValueAtIndex(runs, r);
            CGContextSetTextMatrix(context, CGAffineTransformIdentity);
            CGContextSetTextPosition(context, posX, posY);
            //            YYTextDrawRun(line, run, context, size, isVertical, lineRunRanges[r], verticalOffset);
            [self drawLine:line run:run context:context size:size range:[lineRunRanges objectAtIndex:r]];
        }
    }
    
    CGContextRestoreGState(context);
    
}

- (void)drawLine:(WRTextLine*)line run:(CTRunRef)run context:(CGContextRef)context size:(CGSize)size range:(NSArray *)runRanges {
    CGContextSaveGState(context);
    {
        CTLineRef ctLine = line.ctLine;
        CFArrayRef runArray = CTLineGetGlyphRuns(ctLine);
        CFIndex runCount = CFArrayGetCount(runArray);

        for (CFIndex j = 0; j < runCount; ++j) {
            CTRunRef run = CFArrayGetValueAtIndex(runArray, j);
                   
            CGFloat horizontalOffset = self.vertical ? (size.width - self.textBoundingSize.width) / 2.0 : 0;
            switch (self.horizontalAlignment) {
                case WRTextHorizontalAlignmentLeading:
                    horizontalOffset = 0;
                    break;
                    
                case WRTextHorizontalAlignmentCenter:
                    horizontalOffset = (size.width - self.textBoundingSize.width) / 2.0;
                    break;

                default:
                    horizontalOffset = size.width - self.textBoundingSize.width;
                    break;
            }

            
            CGFloat verticalOffset = line.position.y;
            switch (self.verticalAlignment) {
                case WRTextVerticalAlignmentCenter:
                    verticalOffset = line.position.y - (size.height - line.bounds.size.height) / 2.0;
                    break;
                    
                case WRTextVerticalAlignmentTrailing:
                    verticalOffset = line.position.y  - size.height + line.bounds.size.height;
                    break;

                default:
                    break;
            }

            
            CGContextSetTextPosition(context, line.position.x, verticalOffset);
//            if (i > self.container.displayLineCount) {
//                return;
//            }
//                CFDictionaryRef dicRef = CTRunGetAttributes(run);
//                UIFont *font = CFDictionaryGetValue(dicRef, NSFontAttributeName);

            CATransform3D transform3d = CATransform3DMakeAffineTransform(CGAffineTransformIdentity);
            transform3d = CATransform3DRotate(transform3d, M_PI_2 * 3, 0, 0, 1);
            CGAffineTransform transform = CATransform3DGetAffineTransform(transform3d);
            CGContextSetTextMatrix(context, transform);
            CGContextSetTextPosition(context, line.position.x + horizontalOffset, self.containerSize.height + verticalOffset);
            CTRunDraw(run, context, CFRangeMake(0, 0));

        }

    }
    CGContextRestoreGState(context);
}

@end
