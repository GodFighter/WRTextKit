//
//  WRVerticalButton.m
//  WRTextKitDemo
//
//  Created by 项辉 on 2019/12/31.
//  Copyright © 2019 项辉. All rights reserved.
//

#import "WRVerticalLabel.h"
#import "WRVerticalButton.h"

//MARK: -
@interface WRButton : UIButton

@property (weak, nonatomic) WRVerticalButton *verticalButton;

@end

@implementation WRButton

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    self.verticalButton.highlighted = highlighted;
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    self.verticalButton.selected = selected;
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    self.verticalButton.enabled = enabled;
}
@end

//MARK: -
@interface WRVerticalButton ()

@property (weak, nonatomic) WRVerticalLabel *titleLabel;
@property (weak, nonatomic) UIImageView *imageView;
@property (weak, nonatomic) UIImageView *backgroundImageView;

@property (weak, nonatomic) WRButton *coverButton;

@end

//MARK:-
IB_DESIGNABLE
@implementation WRVerticalButton


//MARK:-  life
- (instancetype)init {
    if (self = [super init]) {
        [self init_defaultValue];
        [self init_UI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];

    [self init_defaultValue];
    [self init_UI];
}

//MARK:-  private
- (void)init_defaultValue {
    self.font = [UIFont systemFontOfSize:15];
    
}

- (void)init_UI {
    self.titleLabel.textColor = [self.coverButton titleColorForState:UIControlStateNormal];
    self.titleLabel.highlightedTextColor = [self.coverButton titleColorForState:UIControlStateHighlighted];
}

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    [self.coverButton addTarget:target action:action forControlEvents:controlEvents];
}

- (void)setNumberOfLines:(NSInteger)numberOfLines {
    self.titleLabel.numberOfLines = numberOfLines;
}

- (void)setFont:(UIFont *)font {
    _font = font;
    self.titleLabel.font = _font;
}

- (void)setHighlighted:(BOOL)highlighted {
    self.titleLabel.highlighted = highlighted;
}

- (void)setSelected:(BOOL)selected {
    self.titleLabel.textColor = selected ? [self.coverButton titleColorForState:UIControlStateSelected] : [self.coverButton titleColorForState:UIControlStateNormal];
}

- (void)setEnabled:(BOOL)enabled {
    self.titleLabel.textColor = enabled ? [self.coverButton titleColorForState:UIControlStateDisabled] : [self.coverButton titleColorForState:UIControlStateNormal];
}

//MARK:-  public
- (void)setTitle:(nullable NSString *)title forState:(UIControlState)state {
    [self.coverButton setTitle:title forState:state];
    self.titleLabel.text = title;
        
}
- (void)setAttributedTitle:(nullable NSAttributedString *)title forState:(UIControlState)state {
    [self.coverButton setAttributedTitle:title forState:state];
    self.titleLabel.attributedText = title;
}

- (void)setTitleColor:(nullable UIColor *)color forState:(UIControlState)state {
    [self.coverButton setTitleColor:color forState:state];
    self.titleLabel.textColor = [self.coverButton titleColorForState:UIControlStateNormal];
}

- (void)setImage:(nullable UIImage *)image forState:(UIControlState)state {
    
}

- (void)setBackgroundImage:(nullable UIImage *)image forState:(UIControlState)state {
    
}

- (nullable NSString *)titleForState:(UIControlState)state {
    return [self.coverButton titleForState:state];
}

- (nullable UIColor *)titleColorForState:(UIControlState)state {
    return [self.coverButton titleColorForState:state];
}

- (nullable NSAttributedString *)attributedTitleForState:(UIControlState)state {
    return [self.coverButton attributedTitleForState:state];
}

- (nullable UIImage *)imageForState:(UIControlState)state {
    return [self.coverButton imageForState:state];
}

- (nullable UIImage *)backgroundImageForState:(UIControlState)state {
    return [self.coverButton backgroundImageForState:state];
}

//MARK:-  lazy
- (WRVerticalLabel *)titleLabel {
    if (_titleLabel == nil) {
        WRVerticalLabel *titleLabel = [WRVerticalLabel new];
        [self insertSubview:titleLabel aboveSubview:self.backgroundImageView];
        _titleLabel = titleLabel;
        
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLabel.verticalAlignment = WRTextVerticalAlignmentCenter;
        _titleLabel.horizontalAlignment = WRTextHorizontalAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor clearColor];
        
        [self addConstraints:@[
            [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0],
            [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0],
            [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0],
            [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]
        ]];

    }
    return _titleLabel;
}

- (UIImageView *)backgroundImageView {
    if (_backgroundImageView == nil) {
        UIImageView *backgroundImageView = [UIImageView new];
        [self insertSubview:backgroundImageView atIndex:0];
        _backgroundImageView = backgroundImageView;
    }
    return _backgroundImageView;
}

- (WRButton *)coverButton {
    if (_coverButton == nil) {
        WRButton *coverButton = [WRButton buttonWithType:UIButtonTypeCustom];
        [self insertSubview:coverButton aboveSubview:self.titleLabel];
//        coverButton.alpha = 0;
        _coverButton = coverButton;
        _coverButton.translatesAutoresizingMaskIntoConstraints = NO;
        _coverButton.titleLabel.alpha = 0.0;
        _coverButton.verticalButton = self;

        [self addConstraints:@[
            [NSLayoutConstraint constraintWithItem:_coverButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0],
            [NSLayoutConstraint constraintWithItem:_coverButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0],
            [NSLayoutConstraint constraintWithItem:_coverButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0],
            [NSLayoutConstraint constraintWithItem:_coverButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]
        ]];
    }
    return _coverButton;
}

@end

