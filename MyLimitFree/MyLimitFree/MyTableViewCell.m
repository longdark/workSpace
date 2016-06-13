//
//  MyTableViewCell.m
//  MyLimitFree
//
//  Created by 千锋 on 16/6/13.
//  Copyright (c) 2016年 骁骁. All rights reserved.
//

#import "MyTableViewCell.h"
#import "AppListModel.h"
#import <UIImageView+AFNetworking.h>
#import "StartView.h"

@interface MyTableViewCell ()

@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@property (strong, nonatomic) IBOutlet UILabel *dateLabel;

@property (strong, nonatomic) IBOutlet UILabel *priceLabel;

@property (strong, nonatomic) IBOutlet UILabel *typeLabel;

@property (strong, nonatomic) IBOutlet UILabel *countLabel;

@property (strong, nonatomic) IBOutlet StartView *starView;

@end

@implementation MyTableViewCell

- (void)setModel:(AppListModel *)model{

    _model = model;
    
    [self.iconImageView setImageWithURL:[NSURL URLWithString:model.iconUrl] placeholderImage:[UIImage imageNamed:@""]];
    
    self.nameLabel.text = model.name;
    self.dateLabel.text = model.releaseDate;
//    self.priceLabel.text = model.lastPrice;
    
    NSAttributedString *attri = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"¥%@", model.lastPrice] attributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle)}];
    
    self.priceLabel.attributedText = attri;
    
    self.typeLabel.text = model.categoryName;
    self.countLabel.text = [NSString stringWithFormat:@"分享:%@ 收藏:%@ 下载:%@", model.shares, model.favorites, model.downloads];
    
    self.starView.starValue = @"3";
    
}

- (void)awakeFromNib {
    // Initialization code
    self.iconImageView.layer.masksToBounds = YES;
    self.iconImageView.layer.cornerRadius = 10;
    
    //使用自己的字体
    self.nameLabel.font = [UIFont fontWithName:@"HYZhuanShuF" size:17];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
