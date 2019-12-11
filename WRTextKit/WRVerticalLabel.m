//
//  WRVerticalLabel.m
//  WRTextKitDemo
//
//  Created by 项辉 on 2019/12/11.
//  Copyright © 2019 项辉. All rights reserved.
//

#import "WRTextLayout.h"
#import "WRVerticalLabel.h"

@interface WRVerticalLabel ()

@property (nonatomic, strong) NSMutableAttributedString *innerText;
@property (nonatomic, strong) WRTextLayout *textLayout;

@end

@implementation WRVerticalLabel

- (instancetype)init {
    if (self = [super init]) {
        _font = [UIFont systemFontOfSize:15];
    }
    return self;
}

- (void)setText:(NSString *)text {
    if (_text == text || [_text isEqualToString:text]) return;
    _text = text.copy;
    if (!_text) _text = @"";
    self.innerText = [[NSMutableAttributedString alloc] initWithString:_text];
    if (self.font) {
        [self.innerText addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, _text.length)];
        
        
        NSMutableParagraphStyle *paragraphStyle =  [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = NSLineBreakByTruncatingMiddle;

        [self.innerText addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, _text.length)];
    }
    self.textLayout.text = self.innerText;
    [self layoutIfNeeded];
}

- (void)setFont:(UIFont *)font {
    if (_font == font || [_font isEqual:font]) return;
    _font = font;
    [self.innerText addAttribute:NSFontAttributeName value:_font range:NSMakeRange(0, _text.length)];
    
//    NSMutableParagraphStyle *paragraphStyle =  [[NSMutableParagraphStyle alloc] init];
//    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
//
//    [self.innerText addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(56, 67)];

    self.textLayout.text = self.innerText;
//    self.frame = CGRectMake(100, 100, self.textLayout.textBoundingSize.width, self.textLayout.textBoundingSize.height);
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    self.textLayout.containerSize = frame.size;
    [self layoutIfNeeded];
}

- (void)drawRect:(CGRect)rect {
    [self.textLayout drawInContext:UIGraphicsGetCurrentContext() size:self.bounds.size];
}

#pragma mark - lazy
- (WRTextLayout *)textLayout {
    if (!_textLayout) {
        _textLayout = [WRTextLayout new];
        _textLayout.containerSize = CGSizeMake(200, 200);
        _textLayout.textAlignment = WRTextAlignmentCenter;
    }
    return _textLayout;
}

@end
