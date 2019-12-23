//
//  ViewController.m
//  WRTextKitDemo
//
//  Created by 项辉 on 2019/12/11.
//  Copyright © 2019 项辉. All rights reserved.
//

#import "ViewController.h"
#import "WRVerticalLabel.h"
#import "WRVerticalButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WRVerticalButton *button = [[WRVerticalButton alloc] initWithFrame:CGRectMake(100, 100, 50, 190)];
    
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [button setTitle:@"水电费水电费" forState:UIControlStateNormal];
    [button setTitle:@"2323" forState:UIControlStateHighlighted];
    button.font = [UIFont fontWithName:@"MongolQaganTig" size:20];
    [button.backgroundView layoutIfNeeded];
    button.backgroundView.clipsToBounds = YES;
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    button.backgroundView.layer.cornerRadius = 15;
    
    [button addTarget:self action:@selector(action_button:) forControlEvents:UIControlEventTouchUpInside];
    

    /*
    WRVerticalLabel *label = [[WRVerticalLabel alloc] init];
    [self.view addSubview:label];
    label.backgroundColor = [UIColor redColor];
    
    label.frame = CGRectMake(100, 100, 10, 400);
    
    
//    label.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.view addConstraints:@[
//                               [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:100],
//                               [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-100],
//                               [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:200],
//                               [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-300]
//                               ]
//     ];
     
    
    label.textColor = [UIColor yellowColor];
    label.text = @"good  ᠪᠠᠭᠤᠯᠭᠠᠬᠤ ᠲᠤᠰᠭᠠᠢ good  ᠪᠠᠭᠤᠯᠭᠠᠬᠤ ᠲᠤᠰᠭᠠᠢ ᠪᠠᠭᠤᠯᠭᠠᠬᠤ ᠲᠤᠰᠭᠠᠢᠪᠠᠭᠤᠯᠭᠠᠬᠤ ᠲᠤᠰᠭᠠᠢ ᠪᠠᠭᠤᠯᠭᠠᠬᠤ ᠲᠤᠰᠭᠠᠢ ᠪᠠᠭᠤᠯᠭᠠᠬᠤ ᠲᠤᠰᠭᠠᠢ ᠪᠠᠭᠤᠯᠭᠠᠬᠤ ᠲᠤᠰᠭᠠᠢ ᠪᠠᠭᠤᠯᠭᠠᠬᠤ ᠲᠤᠰᠭᠠᠢ ᠪᠠᠭᠤᠯᠭᠠᠬᠤ ᠲᠤᠰᠭᠠᠢ ᠪᠠᠭᠤᠯᠭᠠᠬᠤ ᠲᠤᠰᠭᠠᠢ 好";
    label.font = [UIFont fontWithName:@"MongolQaganTig" size:20];
    
    label.lineBreakMode = NSLineBreakByTruncatingMiddle;
    */
}

- (void)action_button:(WRVerticalButton *)button {
    button.selected = !button.selected;
}


@end
