//
//  LimitFreeViewController.m
//  MyLimitFree
//
//  Created by 千锋 on 16/6/12.
//  Copyright (c) 2016年 骁骁. All rights reserved.
//

#import "LimitFreeViewController.h"

@interface LimitFreeViewController ()

@end

@implementation LimitFreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)init{
    if (self = [super init]) {
        self.requestUrl = kLimitUrl;
    }
    return self;
}

@end
