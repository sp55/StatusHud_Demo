//
//  StatusHud.h
//  StatusHud
//
//  Created by admin on 16/7/1.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    StatusHudFromTop,
    StatusHudFromLeft,
    StatusHudFromRight
}StatusHudFrom;

@interface StatusHud : NSObject


/**
 * 显示普通信息
 */
+ (void)showNewMessage:(NSString *)msg from:(StatusHudFrom)fromDirect;

@end
