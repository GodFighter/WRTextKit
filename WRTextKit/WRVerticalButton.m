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
        if (self.backgroundView.superview == nil) {
            [self.superview insertSubview:self.backgroundView belowSubview:self];
        }
        if (self.mongolianLabel.superview == nil) {
            [self.superview insertSubview:self.mongolianLabel aboveSubview:self.backgroundView];
        }
        self.font = [UIFont systemFontOfSize:15];
        
        self.titleLabel.hidden = YES;
    }
}

- (void)layoutSubviews {
    
    self.mongolianLabel.text = [self titleForState:UIControlStateNormal];
    self.mongolianLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.mongolianLabel.center = self.center;
    self.backgroundView.frame = self.frame;
}

- (void)setFont:(UIFont *)font {
    _font = font;
    self.mongolianLabel.font = _font;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
}

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state {
    [super setTitleColor:color forState:state];
    if ([self titleColorForState:UIControlStateNormal] != [UIColor clearColor]) {
        self.mongolianLabel.textColor = [self titleColorForState:UIControlStateNormal];
    }
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    
    self.mongolianLabel.textColor = enabled ? [self titleColorForState:UIControlStateNormal] : [self titleColorForState:UIControlStateDisabled];
}

- (void)setHidden:(BOOL)hidden {
    [super setHidden:hidden];
    
    self.mongolianLabel.hidden = hidden;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [super setBackgroundColor:[UIColor clearColor]];
    self.wr_backgroundColor = backgroundColor;

    if (backgroundColor != [UIColor clearColor]) {
        self.backgroundView.backgroundColor = backgroundColor;
    }
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    self.mongolianLabel.textColor = highlighted ? [self titleColorForState:UIControlStateHighlighted] : [self titleColorForState:UIControlStateNormal];
}


#pragma mark - lazy
- (WRVerticalLabel *)mongolianLabel {
    if (_mongolianLabel == nil) {
        WRVerticalLabel *label = [WRVerticalLabel new];
        [self.superview insertSubview:label aboveSubview:self.backgroundView];
        _mongolianLabel = label;
        
        _mongolianLabel.font = _font;
        _mongolianLabel.verticalAlignment = WRTextVerticalAlignmentCenter;
        _mongolianLabel.backgroundColor = [UIColor clearColor];
        _mongolianLabel.textColor = [self titleColorForState:UIControlStateNormal] == [UIColor clearColor] ? [UIColor blackColor] : [self titleColorForState:UIControlStateNormal];
        _mongolianLabel.text = [self titleForState:UIControlStateNormal];
    }
    return _mongolianLabel;
}

- (UIView *)backgroundView {
    if (_backgroundView == nil) {
        UIView *bgView = [UIView new];
        [self.superview insertSubview:bgView belowSubview:self];
        _backgroundView = bgView;
        _backgroundView.backgroundColor = self.wr_backgroundColor;
        _backgroundView.frame = self.frame;
    }
    return _backgroundView;
}

@end
