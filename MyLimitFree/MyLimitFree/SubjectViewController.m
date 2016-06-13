//
//  SubjectViewController.m
//  MyLimitFree
//
//  Created by 千锋 on 16/6/12.
//  Copyright (c) 2016年 骁骁. All rights reserved.
//

#import "SubjectViewController.h"

@interface SubjectViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SubjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatUI];
}

- (instancetype)init{
    if (self = [super init]) {
        self.requestUrl = kSubjectUrl;
    }
    return self;
}

#pragma mark - 上拉刷新  下拉加载

-  (void) addMJRefresh{

    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh:)];
    [header setTitle:@"Pull down to refresh" forState:MJRefreshStateIdle];
    [header setTitle:@"Release to refresh" forState:MJRefreshStatePulling];
    [header setTitle:@"no data" forState:MJRefreshStateRefreshing];
    
    header.stateLabel.font = [UIFont systemFontOfSize:15];
    header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:14];
    
    self.tableView.mj_header = header;
    
    MJRefreshBackGifFooter *footer = [MJRefreshBackGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(refresh:)];
    [footer setTitle:@"点击开始刷新" forState:MJRefreshStateIdle];
    
    [footer setTitle:@"正在加载更多" forState:MJRefreshStatePulling];
    
    [footer setTitle:@"已经没有数据" forState:MJRefreshStateRefreshing];
    
    footer.stateLabel.font = [UIFont systemFontOfSize:17];
 
    self.tableView.mj_footer = footer;

}

- (void) refresh:(MJRefreshHeader *)hearder{
    
}

- (void)creatUI{
    
    _tableView = [[UITableView alloc] init];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:_tableView];
    
    __weak typeof(self) weakself = self;
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakself.view);
    }];
    
    [self addMJRefresh];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
