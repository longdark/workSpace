//
//  AppListModel.m
//  MyLimitFree
//
//  Created by 千锋 on 16/6/13.
//  Copyright (c) 2016年 骁骁. All rights reserved.
//

#import "AppListModel.h"

@implementation AppListModel

//
+ (NSDictionary *) modelCustomPropertyMapper{
    return @{@"descrip" : @"description"};
}

- (NSString *)description{
    return _descrip;
}

@end
