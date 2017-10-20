//
//  AppDelegate.h
//  MVVM
//
//  Created by Arthur on 2017/10/20.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

