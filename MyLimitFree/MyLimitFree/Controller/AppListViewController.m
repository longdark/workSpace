//
//  AppListViewController.m
//  MyLimitFree
//
//  Created by 千锋 on 16/6/12.
//  Copyright (c) 2016年 骁骁. All rights reserved.
//

#import "AppListViewController.h"
#import "CategoryViewController.h"
#import "SettingViewController.h"

@interface AppListViewController ()<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>{

    UISearchBar *search;
}

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation AppListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatUI];
}

#pragma mark - 上拉刷新  下拉加载

-  (void) addMJRefresh{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.tableView.mj_header endRefreshing];
    }];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.tableView.mj_footer endRefreshing];
    }];
    
}

#pragma mark - 创建UI
- (void)creatUI{
    [self addNavigationItemTitle:@"分类" isBack:NO isRight:NO target:self action:@selector(category:)];
    [self addNavigationItemTitle:@"设置" isBack:NO isRight:YES target:self action:@selector(setting:)];
    
    _tableView = [[UITableView alloc] init];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;

    
    [self.view addSubview:_tableView];
    
    
    __weak typeof(self) weakself = self;
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakself.view);
    }];
    
    [self addMJRefresh];
    search = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 0, 40)];
    search.showsCancelButton = YES;
    search.delegate = self;

    search.placeholder = @"百万应用等你来搜呦";
    self.tableView.tableHeaderView = search;
}

#pragma mark - searchBar  Delegate
- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar{

}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    searchBar.text = nil;
}

- (void) category:(UIButton *)button{
    [search resignFirstResponder];
    search.text = nil;
    
    CategoryViewController *category = [[CategoryViewController alloc] init];
    
    category.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:category animated:YES];
}

- (void) setting:(UIButton *)button{
    SettingViewController *setting = [[SettingViewController alloc] init];
    setting.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:setting animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
