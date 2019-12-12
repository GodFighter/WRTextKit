//
//  WRVerticalLabel.h
//  WRTextKitDemo
//
//  Created by 项辉 on 2019/12/11.
//  Copyright © 2019 项辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WRTextLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface WRVerticalLabel : UIView

@property (null_resettable, nonatomic, copy) NSString *text;

@property (nullable, nonatomic, strong) UIFont *font;

@property (nonatomic) WRTextVerticalAlignment verticalAlignment;
@property (nonatomic) WRTextHorizontalAlignment horizontalAlignment;

@property (nonatomic) NSLineBreakMode lineBreakMode;


@end

NS_ASSUME_NONNULL_END
