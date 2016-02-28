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
- (UISegmentedControl *)segmented{
    if (!_segmented) {
        self.segmented = [[UISegmentedControl alloc]initWithItems:@[@"未支付", @"已支付", @"已取消"]];
        self.segmented.frame = CGRectMake(kSegmented_Left, kSegmented_Top, kSegmented_Width, kSegmented_Height);
        self.segmented.tintColor = [UIColor blackColor];
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
        [self.view addSubview:_listView];
    }
    return _listView;
}

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"订单列表";
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadData];
    [self segmented];
    [self listView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadData {
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithCapacity:1];
        
        // 解析本地JSON文件获取数据，生产环境中从网络获取JSON
        NSString *path = [[NSBundle mainBundle] pathForResource:@"orders" ofType:@"json"];
        NSError *error = nil;
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data
                                                       options:NSJSONReadingAllowFragments
                                                         error:&error];
        _dataSource = [ZXOrderModel objectArrayWithKeyValuesArray:arr];
        if (error) {
            NSLog(@"address.json - fail: %@", error.description);
        }
    }
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
}

#pragma mark - Segment M
- (void)handleSegmented:(UISegmentedControl *)segmented {
    NSInteger index = segmented.selectedSegmentIndex;
    switch (index) {
        case 0:
            [_segmented setTintColor:[UIColor blackColor]];
            break;
        case 1:
            [_segmented setTintColor:[UIColor purpleColor]];
            break;
        case 2:
            [_segmented setTintColor:[UIColor grayColor]];
            break;
        default:
            break;
    }
}

@end
