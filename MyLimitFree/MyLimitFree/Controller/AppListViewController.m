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
#import "AppListModel.h"
#import "MyTableViewCell.h"

@interface AppListViewController ()<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>{

    UISearchBar *search;
    
}

//数据源数组
@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation AppListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatUI];
    
    [self requestDataWithPage:1 search:@"" cateId:@""];
}

- (NSMutableArray *)dataArray{
    
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    
    return _dataArray;
}

#pragma mark - 上拉刷新  下拉加载

-  (void) addMJRefresh{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self requestDataWithPage:1 search:@"" cateId:@""];
        
        //[self.tableView.mj_header endRefreshing];
    }];
    
  
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        NSInteger page = self.dataArray.count / 20 + 1;
        [self requestDataWithPage:page search:@"" cateId:@""];
        //[self.tableView.mj_footer endRefreshing];
    }];
    
}

#pragma mark - 数据请求

- (void) requestDataWithPage:(NSInteger)page search:(NSString *)search cateId:(NSString *)cateId{
    
    NSDictionary *dict = @{@"page" : [NSNumber numberWithInteger:page], @"number" : @20, @"search" : search};
    
    if (self.cateId.length > 0) {
        dict = @{@"page" : [NSNumber numberWithInteger:page], @"number" : @20, @"search" : search, @"cate_id" : self.cateId};
    }
    
    [self.requestManager GET:self.requestUrl parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        //NSLog(@"%@", responseObject);
        
        NSArray *plistArray = responseObject[@"applications"];
        
        //将字典数组转换成模型数组
        
        NSArray *appArray = [NSArray yy_modelArrayWithClass:[AppListModel class] json:plistArray];
        
        if ([self.tableView.mj_header isRefreshing]) {
            [self.dataArray removeAllObjects];
        }
        
        [self.dataArray addObjectsFromArray:appArray];
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        
        
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error: %@", error);
    }];
    
}

#pragma mark - 创建UI
- (void)creatUI{
    [self addNavigationItemTitle:@"分类" isBack:NO isRight:NO target:self action:@selector(category:)];
    [self addNavigationItemTitle:@"设置" isBack:NO isRight:YES target:self action:@selector(setting:)];
    
    _tableView = [[UITableView alloc] init];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;

    
    [self.view addSubview:_tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = 144;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
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

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    cell.model = self.dataArray[indexPath.row];
    
    return cell;
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
    
    category.sandValue = ^(NSString *cateId){
        self.cateId = cateId;
        
        [self.tableView.mj_header beginRefreshing];
    };
    
    
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
