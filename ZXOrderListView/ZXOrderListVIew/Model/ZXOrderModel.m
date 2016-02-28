//
//  ZXOrderModel.m
//  ZXOrderListView
//
//  Created by Xiang on 16/2/27.
//  Copyright © 2016年 周想. All rights reserved.
//

#import "ZXOrderModel.h"
#import "MJExtension.h"

@implementation ZXOrderModel

// 实现这个方法的目的：告诉MJExtension框架模型中的属性名对应着字典的哪个key
+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{@"orderID" : @"order_id",
             @"orderType" : @"order_type",
             @"orderNO" : @"order_no",
             @"orderPeopleCount" : @"order_peopleCount",
             @"orderStatus" : @"order_status",
             @"orderGoodsCount" : @"order_goodsCount",
             @"orderSalePrice" : @"order_price",
             @"orderGoodsArray" : @"order_goodsArray",
             @"orderTime" : @"order_time"
             };
}

@end
