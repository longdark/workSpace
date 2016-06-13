//
//  MyTableViewCell.h
//  MyLimitFree
//
//  Created by 千锋 on 16/6/13.
//  Copyright (c) 2016年 骁骁. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AppListModel;

@interface MyTableViewCell : UITableViewCell

@property (nonatomic, strong) AppListModel *model;

@end
