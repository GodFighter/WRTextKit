//
//  WRTextLayout.h
//  WRTextKitDemo
//
//  Created by 项辉 on 2019/12/11.
//  Copyright © 2019 项辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@class WRVerticalLabel;

NS_ASSUME_NONNULL_BEGIN

//MARK:-
@interface WRTextLayout : NSObject

@property (nonatomic, assign) BOOL vertical;

@property (nonatomic, weak) WRVerticalLabel *label;

@property (nonatomic, strong) NSMutableAttributedString *text;

@property (nonatomic, assign) CGSize containerSize;

@property (nonatomic, assign, readonly) CGRect textBoundingRect;
@property (nonatomic, assign, readonly) CGSize textBoundingSize;

- (void)drawInContext:(CGContextRef)context size:(CGSize)size;

+ (CGFloat)widthWithText:(NSString *)text height:(CGFloat)height font:(UIFont *)font;
+ (CGFloat)widthWithAttributedText:(NSAttributedString *)text height:(CGFloat)height font:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
