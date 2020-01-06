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

@property (weak, nonatomic) IBOutlet WRVerticalLabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.label.textColor = [UIColor redColor];
//    self.label.font = [UIFont fontWithName:@"MongolQaganTig" size:24];
//    self.label.text = @"水电费水电费dfgdfgdfgdg水电费水电费dfgdfgdfgdg";
//    WRVerticalLabel *label = [WRVerticalLabel new];
//    label.font = [UIFont fontWithName:@"MongolQaganTig" size:20];
//    [self.view addSubview:label];
//    label.frame = CGRectMake(0, 100, 80, 100);
//    label.text = @"水电费水电费dfgdfgdfgdg水电费水电费dfgdfgdfgdg";
    
    
    
    WRVerticalButton *button = [[WRVerticalButton alloc] initWithFrame:CGRectMake(100, 100, 80, 190)];

    button.enabled = NO;
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    [button setTitle:@"水电费水电费dfgdfgdfgdg水电费水电费dfgdfgdfgdg" forState:UIControlStateNormal];
    [button setTitle:@"2323" forState:UIControlStateDisabled];
    button.font = [UIFont fontWithName:@"MongolQaganTig" size:20];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];

    [button addTarget:self action:@selector(action_button:) forControlEvents:UIControlEventTouchUpInside];
//    

//    NSString *stirng= @"水电费水电费是分身乏术地方电饭锅电饭锅电饭锅好水电费水电费是分身乏术地方电饭锅电饭锅分身乏术地方电饭锅电饭锅电饭锅好水电费水电费是分身乏分身乏术地方电饭锅电饭锅电饭锅好水电费水电费是分身乏分身乏术地方电饭锅电饭锅电饭锅好水电费水电费是分身乏";
//
//    CGFloat height = [WRVerticalLabel heightWithText:stirng height:400 font:[UIFont fontWithName:@"DelehiSoninQaganTig" size:19]];

//    WRVerticalLabel *label = [[WRVerticalLabel alloc] init];
//    [self.view addSubview:label];
//    label.backgroundColor = [UIColor redColor];
//    
//    label.textColor = [UIColor yellowColor];
//    label.frame = CGRectMake(100, 100, 330, 400);
////    label.text = @"good  ᠪᠠᠭᠤᠯᠭᠠᠬᠤ ᠲᠤᠰᠭᠠᠢ good  ᠪᠠᠭᠤᠯᠭᠠᠬᠤ ᠲᠤᠰᠭᠠᠢ ᠪᠠᠭᠤᠯᠭᠠᠬᠤ ᠲᠤᠰᠭᠠᠢᠪᠠᠭᠤᠯᠭᠠᠬᠤ ᠲᠤᠰᠭᠠᠢ ᠪᠠᠭᠤᠯᠭᠠᠬᠤ ᠲᠤᠰᠭᠠᠢ ᠪᠠᠭᠤᠯᠭᠠᠬᠤ ᠲᠤᠰᠭᠠᠢ ᠪᠠᠭᠤᠯᠭᠠᠬᠤ ᠲᠤᠰᠭᠠᠢ ᠪᠠᠭᠤᠯᠭᠠᠬᠤ ᠲᠤᠰᠭᠠᠢ ᠪᠠᠭᠤᠯᠭᠠᠬᠤ ᠲᠤᠰᠭᠠᠢ ᠪᠠᠭᠤᠯᠭᠠᠬᠤ ᠲᠤᠰᠭᠠᠢ 好";
//    label.text = @"水电费水电费是分身乏术地方电饭锅电饭锅电饭锅好水电费水电费是分身乏术地方电饭锅电饭锅分身乏术地方电饭锅电饭锅电饭锅好水电费水电费是分身乏分身乏术地方电饭锅电饭锅电饭锅好水电费水电费是分身乏分身乏术地方电饭锅电饭锅电饭锅好水电费水电费是分身乏";
//    
//    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
////    attr[NSFontAttributeName] = [UIFont fontWithName:@"DelehiQaganTig" size:20];
//    attr[NSFontAttributeName] = [UIFont fontWithName:@"DelehiSoninQaganTig" size:19];
////    attr[NSFontAttributeName] = [UIFont systemFontOfSize:20];
//
//    CGSize size = [label.text boundingRectWithSize:CGSizeMake(400, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attr context:nil].size;
//    
//
//    NSLog(@"%@=====%f",[NSValue valueWithCGSize:size], height);
//    
////    let width = (label.text as NSString).boundingRect(with: CGSize(width: 400, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: [.font : [UIFont fontWithName:@"DelehiSoninQaganTig" size:20]], context: nil).height
//
////    label.font = [UIFont fontWithName:@"DelehiQaganTig" size:20];
//    label.font = [UIFont fontWithName:@"DelehiSoninQaganTig" size:19];
//    label.font = [UIFont systemFontOfSize:20];

    
    /*
    
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
