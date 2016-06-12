//
//  BasicViewController.h
//  MyLimitFree
//
//  Created by 千锋 on 16/6/12.
//  Copyright (c) 2016年 骁骁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicViewController : UIViewController

- (void) addNavigationItemTitle:(NSString *)title isBack:(BOOL)isBack isRight:(BOOL)isRight target:(id)target action:(SEL)action;

- (void) creatUI;

- (void) backLastView;
@end
