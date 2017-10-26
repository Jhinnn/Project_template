//
//  Macros.h
//  VegetablePlot
//
//  Created by Arthur on 2017/6/6.
//  Copyright © 2017年 Arthur. All rights reserved.
//

//中文字体
#define CHINESE_FONT_NAME  @"Heiti SC"
#define CHINESE_SYSTEM(x) [UIFont fontWithName:CHINESE_FONT_NAME size:x]

// MainScreen Height&Width&Bounds
#define kScreenHeight    [[UIScreen mainScreen] bounds].size.height
#define kScreenWidth     [[UIScreen mainScreen] bounds].size.width
#define kScreenBounds [[UIScreen mainScreen] bounds]

//等比例拉伸  A原值，B目标值，C原值
#define kRESIZEWidthORHEIGHT(A, B, C) ((C) / ((A) / (B)))


// 判断是否是iPhone X
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 状态栏高度
#define STATUS_BAR_HEIGHT (iPhoneX ? 44.f : 20.f)
// 导航栏高度
#define NAVIGATION_BAR_HEIGHT (iPhoneX ? 88.f : 64.f)
// tabBar高度
#define TAB_BAR_HEIGHT (iPhoneX ? (49.f+34.f) : 49.f)
// home indicator
#define HOME_INDICATOR_HEIGHT (iPhoneX ? 34.f : 0.f)


#ifdef DEBUG
#define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define NSLog(...)
#endif

// 字体大小(常规/粗体)
#define BOLDSYSTEMFONT(FONTSIZE) [UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE)     [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE)     [UIFont fontWithName:(NAME) size:(FONTSIZE)]

//userdefaultes
#define USERDEFAULTS [NSUserDefaults standardUserDefaults]

//圆角-视图/角度/宽度/颜色
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]] // view圆角

// 是否空对象
#define IS_NULL_CLASS(OBJECT) [OBJECT isKindOfClass:[NSNull class]]

//色值

//全局主色调 背景
#define kGlobalColor [UIColor colorWithRed:40/255.0f green:120/255.0f blue:60/255.0f alpha:1]

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)


#define COLOR_RGB(rgbValue,a) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 green:((float)(((rgbValue) & 0xFF00)>>8))/255.0 blue: ((float)((rgbValue) & 0xFF))/255.0 alpha:(a)]

#define HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]



#define NOTIF_ADD(n, f)     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(f) name:n object:nil]
#define NOTIF_POST(n, o)    [[NSNotificationCenter defaultCenter] postNotificationName:n object:o]
#define NOTIF_REMV()        [[NSNotificationCenter defaultCenter] removeObserver:self]

// weak self
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

//App版本号
#define appMPVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//AppDelegate对象
#define AppDelegateInstance [[UIApplication sharedApplication] delegate]

//获取图片资源
#define IMG_NAME(name)      [UIImage imageNamed:[NSString stringWithFormat:@"%@", name]]

//在Main线程上运行
#define DISPATCH_ON_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);

//主线程上Demo
//DISPATCH_ON_MAIN_THREAD(^{
//更新UI
//})

//在Global Queue上运行
#define DISPATCH_ON_GLOBAL_QUEUE_HIGH(globalQueueBlocl) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), globalQueueBlocl);
#define DISPATCH_ON_GLOBAL_QUEUE_DEFAULT(globalQueueBlocl) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);
#define DISPATCH_ON_GLOBAL_QUEUE_LOW(globalQueueBlocl) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), globalQueueBlocl);
#define DISPATCH_ON_GLOBAL_QUEUE_BACKGROUND(globalQueueBlocl) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), globalQueueBlocl);

//Global Queue
//DISPATCH_ON_GLOBAL_QUEUE_DEFAULT(^{
//异步耗时任务
//})

#define kUIWindow [[[UIApplication sharedApplication] delegate] window]

#pragma mark -

//单例
#define AS_SINGLETON( ... ) \
- (instancetype)sharedInstance; \
+ (instancetype)sharedInstance;

#undef	DEF_SINGLETON
#define DEF_SINGLETON \
- (instancetype)sharedInstance \
{ \
return [[self class] sharedInstance]; \
} \
+ (instancetype)sharedInstance \
{ \
static dispatch_once_t once; \
static id __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[self alloc] init]; } ); \
return __singleton__; \
}


