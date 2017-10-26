//
//  NSObject+BeeNotification.h
//  YiyiAPP
//
//  Created by Visitor on 2016/11/24.
//  Copyright © 2016年 yiyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+BeeProperty.h"

#pragma mark -
//定义通知名字变量
#undef	AS_NOTIFICATION
#define AS_NOTIFICATION( __name ) \
        AS_STATIC_PROPERTY( __name )
//返回的名字  notify.class.name 例如 notify.TabBarViewController.open
#undef	DEF_NOTIFICATION
#define DEF_NOTIFICATION( __name ) \
        DEF_STATIC_PROPERTY3( __name, @"notify", [self description] )
//收到通知触发的函数 可通过 - (void)is:(NSString *)name 判断是哪个通知
#undef	ON_NOTIFICATION
#define ON_NOTIFICATION( __notification ) \
        - (void)handleNotification:(NSNotification *)__notification
//可用于监听多个类下的某个通知  __filter写类名
#undef	ON_NOTIFICATION2
#define ON_NOTIFICATION2( __filter, __notification ) \
        - (void)handleNotification_##__filter:(NSNotification *)__notification
// 类名，通知名（通知名，必须是类名下定义的），可确定触发这个函数
#undef	ON_NOTIFICATION3
#define ON_NOTIFICATION3( __class, __name, __notification ) \
        - (void)handleNotification_##__class##_##__name:(NSNotification *)__notification

#pragma mark -
@interface NSNotification(BeeNotification)

- (BOOL)is:(NSString *)name;
- (BOOL)isKindOf:(NSString *)prefix;

@end

@interface NSObject (BeeNotification)

+ (NSString *)NOTIFICATION;
+ (NSString *)NOTIFICATION_TYPE;

- (void)handleNotification:(NSNotification *)notification;

- (void)observeNotification:(NSString *)name;
//监听这个类里面定义的所有的通知
- (void)observeAllNotifications;

- (void)unobserveNotification:(NSString *)name;
//取消监听这个类里面定义的所有的通知
- (void)unobserveAllNotifications;

+ (BOOL)postNotification:(NSString *)name;
+ (BOOL)postNotification:(NSString *)name withObject:(NSObject *)object;

- (BOOL)postNotification:(NSString *)name;
- (BOOL)postNotification:(NSString *)name withObject:(NSObject *)object;

@end
