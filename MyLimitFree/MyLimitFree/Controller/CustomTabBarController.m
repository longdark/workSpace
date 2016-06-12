//
//  CustomTabBarController.m
//  MyLimitFree
//
//  Created by 千锋 on 16/6/12.
//  Copyright (c) 2016年 骁骁. All rights reserved.
//

#import "CustomTabBarController.h"
#import "HostViewController.h"
#import "FreeViewController.h"
#import "ReductionViewController.h"
#import "LimitFreeViewController.h"
#import "SubjectViewController.h"
#import "CustomNavigationController.h"
@interface CustomTabBarController ()

@end

@implementation CustomTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatControllers];
    [self creatUI];
}
#pragma mark - 创建界面
- (void) creatUI{
    
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar_bg"];
    
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:60 / 255.0 green:130 / 255.0 blue:200 / 255.0 alpha:1]};
    
    self.tabBar.tintColor = [UIColor colorWithRed:60 / 255.0 green:130 / 255.0 blue:200 / 255.0 alpha:1];
    
}
#pragma mark - 创建视图控制器
- (void) creatControllers{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Controllers" ofType:@"plist"];
    
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:path];
    
    [plistArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
       
        NSString *className = obj[@"className"];
        NSString *imageName = obj[@"imageName"];
        NSString *title = obj[@"title"];
        
        Class myClass = NSClassFromString(className);
        
        UIViewController *controller = [[myClass alloc] init];
        
        controller.title = title;
        controller.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        controller.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_press", imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        CustomNavigationController *nav = [[CustomNavigationController alloc] initWithRootViewController:controller];
        [self addChildViewController:nav];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
