//
//  ZXOrderCell.h
//  ZXOrderListView
//
//  Created by Xiang on 16/2/27.
//  Copyright © 2016年 周想. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZXOrderModel;

@interface ZXOrderCell : UITableViewCell

/** 订单模型 */
@property (strong, nonatomic) ZXOrderModel *order;

@end
