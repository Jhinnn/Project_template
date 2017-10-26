//
//  NSObject+BeeNotification.m
//  YiyiAPP
//
//  Created by Visitor on 2016/11/24.
//  Copyright © 2016年 yiyi. All rights reserved.
//

#import "NSObject+BeeNotification.h"
#import "NSObject+Runtime.h"

#pragma mark -

@implementation NSNotification(BeeNotification)

- (BOOL)is:(NSString *)name
{
    return [self.name isEqualToString:name];
}

- (BOOL)isKindOf:(NSString *)prefix
{
    return [self.name hasPrefix:prefix];
}

@end

#pragma mark -

@implementation NSObject (BeeNotification)

+ (NSString *)NOTIFICATION
{
    return [self NOTIFICATION_TYPE];
}

+ (NSString *)NOTIFICATION_TYPE
{
    return [NSString stringWithFormat:@"notify.%@.", [self description]];
}

- (void)handleNotification:(NSNotification *)notification
{
}

- (void)observeNotification:(NSString *)notificationName
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:notificationName
                                                  object:nil];
    
    NSArray * array = [notificationName componentsSeparatedByString:@"."];
    if ( array && array.count > 1 )
    {
        //		NSString * prefix = (NSString *)[array objectAtIndex:0];
        NSString * clazz = (NSString *)[array objectAtIndex:1];
        NSString * name = (NSString *)[array objectAtIndex:2];
        
        {
            NSString * selectorName;
            SEL selector;
            
            selectorName = [NSString stringWithFormat:@"handleNotification_%@_%@:", clazz, name];
            selector = NSSelectorFromString(selectorName);
            
            if ( [self respondsToSelector:selector] )
            {
                [[NSNotificationCenter defaultCenter] addObserver:self
                                                         selector:selector
                                                             name:notificationName
                                                           object:nil];
                return;
            }
            
            selectorName = [NSString stringWithFormat:@"handleNotification_%@:", clazz];
            selector = NSSelectorFromString(selectorName);
            
            if ( [self respondsToSelector:selector] )
            {
                [[NSNotificationCenter defaultCenter] addObserver:self
                                                         selector:selector
                                                             name:notificationName
                                                           object:nil];
                return;
            }
        }
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:notificationName
                                               object:nil];
}

- (void)observeAllNotifications
{
    NSArray * methods = [NSObject allInstanceMethodsOf:[self class] withPrefix:@"handleNotification_"];
    if ( nil == methods || 0 == methods.count )
    {
        return;
    }
    
    for ( NSString * selectorName in methods )
    {
        SEL sel = NSSelectorFromString( selectorName );
        if ( NULL == sel )
            continue;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        
        NSMutableString * notificationName = [self performSelector:sel];
        
#pragma clang diagnostic pop
        if ( nil == notificationName  )
            continue;
        
        [self observeNotification:notificationName];
    }
}

- (void)unobserveNotification:(NSString *)name
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:name
                                                  object:nil];
}

- (void)unobserveAllNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

+ (BOOL)postNotification:(NSString *)name
{
   
    
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:nil];
    return YES;
}

+ (BOOL)postNotification:(NSString *)name withObject:(NSObject *)object
{
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:object];
    return YES;
}

- (BOOL)postNotification:(NSString *)name
{
    return [[self class] postNotification:name];
}

- (BOOL)postNotification:(NSString *)name withObject:(NSObject *)object
{
    return [[self class] postNotification:name withObject:object];
}

@end
