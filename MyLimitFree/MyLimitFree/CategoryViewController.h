//
//  CategoryViewController.h
//  MyLimitFree
//
//  Created by 千锋 on 16/6/12.
//  Copyright (c) 2016年 骁骁. All rights reserved.
//

#import "BasicViewController.h"

@interface CategoryViewController : BasicViewController

@property (nonatomic, copy) void (^sandValue)(NSString *cateId);

@end
