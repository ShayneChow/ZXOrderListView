//
//  ZXOrderDetailController.m
//  ZXOrderListView
//
//  Created by Xiang on 16/3/1.
//  Copyright © 2016年 周想. All rights reserved.
//

#import "ZXOrderDetailController.h"

@interface ZXOrderDetailController ()

@end

@implementation ZXOrderDetailController
#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"订单详情";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.segmented setTintColor:[UIColor purpleColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.listView deselectRowAtIndexPath:indexPath animated:NO];
    UIViewController *orderDetailVC = [[UIViewController alloc] init];
    orderDetailVC.title = @"test";
    orderDetailVC.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:orderDetailVC animated:YES];
}

@end
