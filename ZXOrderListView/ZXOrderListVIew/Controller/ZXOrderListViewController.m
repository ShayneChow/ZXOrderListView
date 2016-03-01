//
//  ZXOrderListViewController.m
//  ZXOrderListView
//
//  Created by Xiang on 16/2/27.
//  Copyright © 2016年 周想. All rights reserved.
//

#import "ZXOrderListViewController.h"
#import "ZXOrderCell.h"
#import "ZXOrderModel.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "ZXOrderDetailController.h"

#define kSegmented_Left 20
#define kSegmented_Top 64+5
#define kSegmented_Width KScreenW-(2*kSegmented_Left)
#define kSegmented_Height 30
#define KScreenW [UIScreen mainScreen].bounds.size.width
#define KScreenH [UIScreen mainScreen].bounds.size.height

@interface ZXOrderListViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UISegmentedControl *segmented;
@property (nonatomic, strong) UITableView *listView;
@property (nonatomic, assign) NSInteger number;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ZXOrderListViewController

static NSString * const OrderCell = @"ZXOrderCell";

#pragma mark - 懒加载
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        self.dataSource = [NSMutableArray arrayWithCapacity:1];
    }
    return _dataSource;
}

- (UISegmentedControl *)segmented{
    if (!_segmented) {
        self.segmented = [[UISegmentedControl alloc]initWithItems:@[@"未支付", @"已支付", @"已取消"]];
        self.segmented.frame = CGRectMake(kSegmented_Left, kSegmented_Top, kSegmented_Width, kSegmented_Height);
        self.segmented.tintColor = [UIColor darkGrayColor];
        self.segmented.selectedSegmentIndex = 0;
        [_segmented addTarget:self action:@selector(handleSegmented:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:_segmented];
    }
    return _segmented;
}

- (UITableView *)listView {
    if (!_listView) {
        _listView = [[UITableView alloc] initWithFrame:CGRectMake(0, kSegmented_Top + kSegmented_Height + 5, KScreenW, KScreenH - kSegmented_Height -74) style:UITableViewStylePlain];
        _listView.delegate = self;
        _listView.dataSource = self;
        //_listView.backgroundColor = [UIColor lightGrayColor];
        _listView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_listView registerNib:[UINib nibWithNibName:NSStringFromClass([ZXOrderCell class]) bundle:nil] forCellReuseIdentifier:OrderCell];
        [self RequestData:@"nonpayment"];
        [self.view addSubview:_listView];
    }
    return _listView;
}

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"订单列表";
    self.view.backgroundColor = [UIColor whiteColor];
    //[self loadData];
    [self segmented];
    [self listView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//下拉刷新,上拉加载
- (void)Refreshing:(NSString *)type{
    //上拉刷新
    _listView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.number = 0;
        [self RequestData:type];
        NSLog(@"=== 点击 “%@” ", type);
        [_listView.mj_header endRefreshing];
    }];
    [_listView.mj_header beginRefreshing];
    
}

// 分类请求数据
- (void)RequestData:(NSString *)type {
    
    // 解析本地JSON文件获取数据，生产环境中从网络获取JSON
    NSString *path = [[NSBundle mainBundle] pathForResource:type ofType:@"json"];
    NSError *error = nil;
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:data
                                                   options:NSJSONReadingAllowFragments
                                                     error:&error];

    _dataSource = [ZXOrderModel objectArrayWithKeyValuesArray:arr];
    if (error) {
        NSLog(@"address.json - fail: %@", error.description);
    }
    NSLog(@"===\n%@", _dataSource);
    [_listView reloadData];

}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZXOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:OrderCell];
    ZXOrderModel *order = _dataSource[indexPath.row];
    cell.order = order;
    return cell;
}

#pragma mark - delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_listView deselectRowAtIndexPath:indexPath animated:NO];
    ZXOrderDetailController *orderDetailVC = [[ZXOrderDetailController alloc] init];
    [self.navigationController pushViewController:orderDetailVC animated:YES];
}

#pragma mark - Segment M
- (void)handleSegmented:(UISegmentedControl *)segmented {
    NSInteger index = segmented.selectedSegmentIndex;
    switch (index) {
        case 0:
            [self Refreshing:@"nonpayment"];
            break;
        case 1:
            [self Refreshing:@"havebeenpaid"];
            break;
        case 2:
            [self Refreshing:@"canceled"];
            break;
        default:
            break;
    }
}

@end
