//
//  CategoryViewController.m
//  MyLimitFree
//
//  Created by 千锋 on 16/6/12.
//  Copyright (c) 2016年 骁骁. All rights reserved.
//

#import "CategoryViewController.h"
#import <UIImageView+AFNetworking.h>

@interface CategoryViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UITableView *categoryTableView ;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation CategoryViewController

- (NSMutableArray *)dataArray{
    
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self creatUI];
    [self requestData];
}

#pragma mark - tableview  xieyi

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    CategoryModel *model = self.dataArray[indexPath.row];
    
    [cell.imageView setImageWithURL:[NSURL URLWithString:model.picUrl] placeholderImage:[UIImage imageNamed:@""]];
    cell.textLabel.text = model.categoryCname;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"共%@款应用, 其中限免%@款",model.categoryCount, model.limited];
    
    return cell;
}

- (void) requestData{

    [self.requestManager GET:kCateUrl parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        //NSLog(@"%@", responseObject);
        
        NSArray *modelArray = [NSArray yy_modelArrayWithClass:[CategoryModel class] json:responseObject];
        //NSLog(@"%@", modelArray);
        
        [self.dataArray addObjectsFromArray:modelArray];
        
        [self.categoryTableView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
    }];
}

#pragma mark - 创建UI
- (void)creatUI{
    self.title = @"分类";
    
    [self addNavigationItemTitle:@"返回" isBack:YES isRight:NO target:self action:@selector(backLastView)];
    
    self.categoryTableView = [[UITableView alloc] init];
    self.categoryTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.categoryTableView];
    [self.categoryTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.categoryTableView.delegate = self;
    self.categoryTableView.dataSource = self;
    self.categoryTableView.rowHeight = 100;
    
    //添加刷新控件
    [self addMJRefresh];
    
    
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CategoryModel *model = self.dataArray[indexPath.row];
    self.sandValue(model.categoryId);
    
    [self backLastView];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
