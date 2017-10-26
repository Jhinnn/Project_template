//
//  BaseScrollViewController.h
//  MVVM
//
//  Created by Arthur on 2017/10/25.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import "BaseViewController.h"
#import "TPKeyboardAvoidingScrollView.h"
@interface BaseScrollViewController : BaseViewController

@property (nonatomic, strong) TPKeyboardAvoidingScrollView *scrollView;

@end
