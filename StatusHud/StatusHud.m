//
//  StatusHud.m
//  StatusHud
//
//  Created by admin on 16/7/1.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "StatusHud.h"
#import <AudioToolbox/AudioToolbox.h>

#define kBadgeColor [UIColor yellowColor]

/** 消息的停留时间 */
static CGFloat const MSMessageDuration = 2.5;
/** 消息显示\隐藏的动画时间 */
static CGFloat const MSAnimationDuration = 0.25;





@implementation StatusHud
/** 全局的窗口 */
static UIWindow *_window;
static BOOL show;
/**边距*/
static CGFloat const MSMargin = 5.0;

+ (void)showNewMessage:(NSString *)msg from:(StatusHudFrom)fromDirect{
    // 显示窗口
    if (show) return;
    _window = [[UIWindow alloc] init];
    [_window makeKeyAndVisible];
    _window.backgroundColor = [UIColor clearColor];
    _window.windowLevel = UIWindowLevelStatusBar;
    
    // 添加文字
    UILabel *label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.backgroundColor = kBadgeColor;
    label.font = [UIFont systemFontOfSize:13];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor redColor];
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius = 2;
    [_window addSubview:label];
    
    //自适应
    CGSize size = [msg boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:label.font} context:nil].size;
    
    size.width += 2*MSMargin;
    size.height += MSMargin;
    
    CGRect frame;
    CGFloat x = 0;
    CGFloat y = 0;
    switch (fromDirect) {
        case StatusHudFromTop:
            frame = CGRectMake(0, -size.height, [UIScreen mainScreen].bounds.size.width, size.height);
            _window.backgroundColor = kBadgeColor;
            x = 0;
            y = size.height;
            break;
        case StatusHudFromLeft:
            frame = CGRectMake(-size.width, 0, size.width, size.height);
            x = size.width;
            y = 0;
            break;
        case StatusHudFromRight:
            frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, size.width, size.height);
            x = -size.width;
            y = 0;
            break;
            
        default:
            break;
    }
    
    _window.frame = frame;
    label.frame = (CGRect){{0, 0}, frame.size};
    [UIView animateWithDuration:MSAnimationDuration animations:^{
        show = YES;
        AudioServicesPlaySystemSound(1000);
        AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
        
        _window.transform = CGAffineTransformMakeTranslation(x, y);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:MSAnimationDuration delay:MSMessageDuration options:UIViewAnimationOptionCurveEaseInOut animations:^{
            _window.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            show = NO;
            [label removeFromSuperview];
            _window = nil;
        }];
    }];
}




@end
