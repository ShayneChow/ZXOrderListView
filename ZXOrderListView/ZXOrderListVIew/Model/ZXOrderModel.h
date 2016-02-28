//
//  ZXOrderModel.h
//  ZXOrderListView
//
//  Created by Xiang on 16/2/27.
//  Copyright © 2016年 周想. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    TakeSeatType = 0,   // 落座类型
    TakeOutType = 1     // 外卖类型
} OrderType;

typedef enum {
    NonPayment = 0,     // 未支付
    HaveBeenPaid = 1,   // 已支付
    Canceled = 2        // 已取消
} OrderStatus;

@interface ZXOrderModel : NSObject

/** 订单编号 */
@property (copy, nonatomic) NSString *orderID;

/** 订单序号 */
@property (copy, nonatomic) NSString *orderNO;  // 与类型搭配使用,类似别名

/** 订单生成时间 */
@property (copy, nonatomic) NSString *orderTime;

/** 订单就餐人数 */
@property (assign, nonatomic) int orderPeopleCount;

/** 订单中包含的商品模型数组 */
@property (strong, nonatomic) NSMutableArray *orderGoodsArray;

/** 订单类型 */
@property (assign, nonatomic) OrderType orderType;

/** 订单状态 */
@property (assign, nonatomic) OrderStatus orderStatus;

/** 订单售价 */
@property (assign, nonatomic) double orderSalePrice;

/** 商品订单数量 */
@property (assign, nonatomic) int orderGoodsCount;

@end
