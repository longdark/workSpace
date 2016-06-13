//
//  BasicViewController.m
//  MyLimitFree
//
//  Created by 千锋 on 16/6/12.
//  Copyright (c) 2016年 骁骁. All rights reserved.
//

#import "BasicViewController.h"

@interface BasicViewController ()



@end

@implementation BasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}
#pragma mark - 懒加载实例化manager
- (AFHTTPSessionManager *)requestManager{

    if (_requestManager == nil) {
        _requestManager = [AFHTTPSessionManager manager];
        
        _requestManager.responseSerializer = [AFJSONResponseSerializer serializer];
        // 在序列化器中追加一个类型，text/html这个类型是不支持的，text/json, application/json
        _requestManager.responseSerializer.acceptableContentTypes = [_requestManager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    }
    

    
    return _requestManager;
}

#pragma mark - 返回上一层

- (void)backLastView{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
#pragma mark - 添加NavigationItem
- (void)addNavigationItemTitle:(NSString *)title isBack:(BOOL)isBack isRight:(BOOL)isRight target:(id)target action:(SEL)action{
    UIButton *button = [[UIButton alloc] init];
    
    [button setTitle:title forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor colorWithRed:69 / 255.0 green:49 / 255.0 blue:69 / 255.0 alpha:1] forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor colorWithR:69 g:49 b:69] forState:UIControlStateNormal];
    
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    if (isBack) {
        button.frame = CGRectMake(0, 0, 63, 30);
        [button setBackgroundImage:[UIImage imageNamed:@"buttonbar_back"] forState:UIControlStateNormal];
    }else{
        button.frame = CGRectMake(0, 0, 44, 30);
        [button setBackgroundImage:[UIImage imageNamed:@"buttonbar_action"] forState:UIControlStateNormal];
    }

    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    if (isRight) {
        
        self.navigationItem.rightBarButtonItem = item;
    
    }else{
        
        self.navigationItem.leftBarButtonItem = item;
    
    }
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
