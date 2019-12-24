//
//  WRVerticalLabel.m
//  WRTextKitDemo
//
//  Created by 项辉 on 2019/12/11.
//  Copyright © 2019 项辉. All rights reserved.
//

#import "WRVerticalLabel.h"

@interface WRVerticalLabel ()

@property (nonatomic, strong) NSMutableAttributedString *innerText;
@property (nonatomic, strong) WRTextLayout *textLayout;

@end

IB_DESIGNABLE
@implementation WRVerticalLabel

- (instancetype)init {
    if (self = [super init]) {
        _font = [UIFont systemFontOfSize:15];
        _verticalAlignment = WRTextVerticalAlignmentLeading;
        _lineBreakMode = NSLineBreakByTruncatingTail;
        _textColor = [UIColor blueColor];
    }
    return self;
}

+ (CGFloat)heightWithText:(NSString *)text height:(CGFloat)height font:(UIFont *)font {
    WRVerticalLabel *label = [WRVerticalLabel new];
    label.textLayout.isCalculationc = YES;
    label.frame = CGRectMake(0, 0, height, height);
    label.font = font;
    label.text = text;
    
    return label.textLayout.textBoundingSize.width;
}

- (CGSize)textSize {
    return self.textLayout.textBoundingSize;
}

- (void)setText:(NSString *)text {
    if (_text == text || [_text isEqualToString:text]) return;
    _text = text.copy;
    if (!_text) _text = @"";
    self.innerText = [[NSMutableAttributedString alloc] initWithString:_text];
    if (self.font) {
        [self.innerText addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, _text.length)];
    }
    if (self.textColor) {
        [self.innerText addAttribute:NSForegroundColorAttributeName value:_textColor range:NSMakeRange(0, _text.length)];
    }
    self.textLayout.text = self.innerText;
    [self setNeedsDisplay];
}

- (void)setFont:(UIFont *)font {
    if (_font == font || [_font isEqual:font]) return;
    _font = font;
    [self.innerText addAttribute:NSFontAttributeName value:_font range:NSMakeRange(0, _text.length)];
    self.textLayout.text = self.innerText;
    [self setNeedsDisplay];
}

- (void)setTextColor:(UIColor *)textColor {
    if (_textColor == textColor || [_textColor isEqual:textColor]) return;
    _textColor = textColor;
    [self.innerText addAttribute:NSForegroundColorAttributeName value:_textColor range:NSMakeRange(0, _text.length)];
    self.textLayout.text = self.innerText;
    [self setNeedsDisplay];
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];

    self.textLayout.containerSize = frame.size;
    [self setNeedsDisplay];
}

- (void)layoutSubviews {
    self.textLayout.containerSize = self.frame.size;
}

- (void)setVerticalAlignment:(WRTextVerticalAlignment)verticalAlignment {
    _verticalAlignment = verticalAlignment;
    self.textLayout.verticalAlignment = _verticalAlignment;
    [self setNeedsDisplay];
}

- (void)setHorizontalAlignment:(WRTextHorizontalAlignment)horizontalAlignment {
    _horizontalAlignment = horizontalAlignment;
    self.textLayout.horizontalAlignment = _horizontalAlignment;
    [self setNeedsDisplay];
}

- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode {
    _lineBreakMode = lineBreakMode;
    self.textLayout.lineBreakMode = lineBreakMode;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    self.textLayout.containerSize = rect.size;
    [self.textLayout drawInContext:UIGraphicsGetCurrentContext() size:self.bounds.size];
}

#pragma mark - lazy
- (WRTextLayout *)textLayout {
    if (!_textLayout) {
        _textLayout = [WRTextLayout new];
        _textLayout.containerSize = CGSizeZero;
    }
    return _textLayout;
}

@end
