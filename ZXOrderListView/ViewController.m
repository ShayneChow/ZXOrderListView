//
//  ViewController.m
//  ZXOrderListView
//
//  Created by Xiang on 16/2/27.
//  Copyright © 2016年 周想. All rights reserved.
//

#import "ViewController.h"
#import "ZXOrderListViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goOrderListViewController {
    ZXOrderListViewController *orderListVC = [[ZXOrderListViewController alloc] init];
    [self.navigationController pushViewController:orderListVC animated:YES];
}

@end
