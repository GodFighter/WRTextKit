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

@implementation WRVerticalLabel

- (instancetype)init {
    if (self = [super init]) {
        _font = [UIFont systemFontOfSize:15];
        _verticalAlignment = WRTextVerticalAlignmentLeading;
        _lineBreakMode = NSLineBreakByTruncatingTail;
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
    }
    self.textLayout.text = self.innerText;
    [self layoutIfNeeded];
}

- (void)setFont:(UIFont *)font {
    if (_font == font || [_font isEqual:font]) return;
    _font = font;
    [self.innerText addAttribute:NSFontAttributeName value:_font range:NSMakeRange(0, _text.length)];

    self.textLayout.text = self.innerText;
    [self layoutIfNeeded];
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    [self layoutIfNeeded];
}

- (void)setVerticalAlignment:(WRTextVerticalAlignment)verticalAlignment {
    _verticalAlignment = verticalAlignment;
    self.textLayout.verticalAlignment = _verticalAlignment;
    [self layoutIfNeeded];
}

- (void)setHorizontalAlignment:(WRTextHorizontalAlignment)horizontalAlignment {
    _horizontalAlignment = horizontalAlignment;
    self.textLayout.horizontalAlignment = _horizontalAlignment;
    [self layoutIfNeeded];
}

- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode {
    _lineBreakMode = lineBreakMode;
    self.textLayout.lineBreakMode = lineBreakMode;
    [self layoutIfNeeded];
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
