//
//  WRVerticalButton.m
//  WRTextKitDemo
//
//  Created by xianghui-iMac on 2019/12/14.
//  Copyright © 2019 项辉. All rights reserved.
//

#import "WRVerticalButton.h"
#import "WRVerticalLabel.h"

//MARK: -
@interface WRVerticalButton ()

@property (weak, nonatomic) WRVerticalLabel *mongolianLabel;
@property (weak, nonatomic, readwrite) UIView *backgroundView;

@property (strong, nonatomic) UIColor *wr_backgroundColor;
@property (copy, nonatomic) NSString *wr;

@end

//MARK: -
@implementation WRVerticalButton

- (void)didMoveToSuperview {
    if (self.superview != nil) {
        self.superview.userInteractionEnabled = YES;
        [self mongolianLabel];
        [self backgroundView];
        self.font = [UIFont systemFontOfSize:15];
        
        self.titleLabel.hidden = YES;
    }
}

- (void)layoutSubviews {
    
    _mongolianLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    _mongolianLabel.center = self.center;
    _backgroundView.frame = self.frame;
}

- (void)setFont:(UIFont *)font {
    _font = font;
    self.mongolianLabel.font = _font;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
    self.mongolianLabel.text = title;
}

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state {
    [super setTitleColor:color forState:state];
    _mongolianLabel.textColor = color;
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    
    _mongolianLabel.textColor = enabled ? [self titleColorForState:UIControlStateNormal] : [self titleColorForState:UIControlStateDisabled];
}

- (void)setHidden:(BOOL)hidden {
    [super setHidden:hidden];
    
    _mongolianLabel.hidden = hidden;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [super setBackgroundColor:[UIColor clearColor]];
    self.wr_backgroundColor = backgroundColor;

    if (backgroundColor != [UIColor clearColor] && self.superview != nil) {
        self.backgroundView.backgroundColor = backgroundColor;
    }
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    _mongolianLabel.textColor = highlighted ? [self titleColorForState:UIControlStateHighlighted] : [self titleColorForState:UIControlStateNormal];
}


#pragma mark - lazy
- (WRVerticalLabel *)mongolianLabel {
    if (_mongolianLabel == nil) {
        WRVerticalLabel *label = [WRVerticalLabel new];
        [self.superview insertSubview:label belowSubview:self];
        _mongolianLabel = label;
        
        _mongolianLabel.font = _font;
        _mongolianLabel.verticalAlignment = WRTextVerticalAlignmentCenter;
        _mongolianLabel.backgroundColor = [UIColor clearColor];
        _mongolianLabel.textColor = [self titleColorForState:UIControlStateNormal];
        _mongolianLabel.text = [self titleForState:UIControlStateNormal];
    }
    return _mongolianLabel;
}

- (UIView *)backgroundView {
    if (_backgroundView == nil) {
        UIView *bgView = [UIView new];
        [self.superview insertSubview:bgView belowSubview:self.mongolianLabel];
        _backgroundView = bgView;
        _backgroundView.backgroundColor = self.wr_backgroundColor;
        _backgroundView.frame = self.frame;
    }
    return _backgroundView;
}

@end
