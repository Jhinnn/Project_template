//
//  NotificationName.h
//  MVVM
//
//  Created by Arthur on 2017/10/26.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotificationName : NSObject

#pragma mark - IM网络状态
AS_NOTIFICATION(network_succ)

AS_NOTIFICATION(network_fail)

AS_NOTIFICATION(network_disconnected)

AS_NOTIFICATION(network_connecting)

@end
