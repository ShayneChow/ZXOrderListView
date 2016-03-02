//
//  ZXOrderListViewController.h
//  ZXOrderListView
//
//  Created by Xiang on 16/2/27.
//  Copyright © 2016年 周想. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXOrderListViewController : UIViewController

@property (nonatomic, strong) UISegmentedControl *segmented;
@property (nonatomic, strong) UITableView *listView;
@property (nonatomic, assign) NSInteger number;

@end
