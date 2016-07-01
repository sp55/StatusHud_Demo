//
//  ViewController.m
//  StatusHud
//
//  Created by admin on 16/7/1.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "ViewController.h"
#import "StatusHud.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


//上
- (IBAction)topBtnAction:(UIButton *)sender {
    [StatusHud showNewMessage:@"我从上边进来" from:StatusHudFromTop];
}
//左
- (IBAction)leftBtnAction:(UIButton *)sender {
    [StatusHud showNewMessage:@"我从左边进来，左边的文字很长很长长很长长很长长很长长很长长很长长很长长很长长很长长很长长很长长很长" from:StatusHudFromLeft];

}
//右
- (IBAction)rightBtnAction:(UIButton *)sender {
    [StatusHud showNewMessage:@"我从右边进来" from:StatusHudFromRight];

}

@end
