//
//  CategoryModel.h
//  MyLimitFree
//
//  Created by 千锋 on 16/6/13.
//  Copyright (c) 2016年 骁骁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>

@interface CategoryModel : NSObject<YYModel>

//类型名
@property (nonatomic, copy) NSString *categoryCname;
//总的数量
@property (nonatomic, copy) NSString *categoryCount;
//类型id
@property (nonatomic, copy) NSString *categoryId;
//限免数量
@property (nonatomic, copy) NSString *limited;
//图片地址
@property (nonatomic, copy) NSString *picUrl;




@end
