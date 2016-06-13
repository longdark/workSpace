//
//  StartView.m
//  MyLimitFree
//
//  Created by 千锋 on 16/6/13.
//  Copyright (c) 2016年 骁骁. All rights reserved.
//

#import "StartView.h"

@interface StartView ()

@property (nonatomic, strong) UIImageView *backgroundImageView;

@property (nonatomic, strong) UIImageView *foregroundView;

@end


@implementation StartView

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        
        self.backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"StarsBackground"]];
        
        [self addSubview:self.backgroundImageView];
        
        self.foregroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"StarsForeground"]];
        
        [self addSubview:self.foregroundView];
        
        self.foregroundView.contentMode = UIViewContentModeLeft;
        self.foregroundView.clipsToBounds = YES;
        
    }
    
    return self;
}

- (void)setStarValue:(NSString *)starValue{
    
    CGRect rect = self.backgroundImageView.frame;
    
    CGFloat realW = rect.size.width * (starValue.floatValue / 5.0);
    
    self.foregroundView.frame = CGRectMake(rect.origin.x, rect.origin.y, realW, rect.size.height);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
