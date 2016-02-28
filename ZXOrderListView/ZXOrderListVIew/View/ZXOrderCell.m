//
//  ZXOrderCell.m
//  ZXOrderListView
//
//  Created by Xiang on 16/2/27.
//  Copyright © 2016年 周想. All rights reserved.
//

#import "ZXOrderCell.h"
#import "ZXOrderModel.h"

@interface ZXOrderCell ()

@property (weak, nonatomic) IBOutlet UILabel *orderTypeNOLabel;
@property (weak, nonatomic) IBOutlet UIImageView *orderGoodsIconVIew;
@property (weak, nonatomic) IBOutlet UILabel *orderIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderGoodsCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderPriceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *orderStatusIconView;
@property (weak, nonatomic) IBOutlet UILabel *orderPeopleCountLabel;

@end

@implementation ZXOrderCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setOrder:(ZXOrderModel *)order {
    _order = order;
    
    _orderPeopleCountLabel.text = [NSString stringWithFormat:@"%i 位", order.orderPeopleCount];
    if (order.orderType == TakeSeatType) {
        // 落座就餐
        _orderTypeNOLabel.text = [NSString stringWithFormat:@"%@", order.orderNO];
        _orderTypeNOLabel.textColor = [UIColor grayColor];
        _orderPeopleCountLabel.hidden = NO;
    } else if (order.orderType == TakeOutType) {
        _orderTypeNOLabel.text = [NSString stringWithFormat:@"外卖-%@", order.orderNO];
        _orderTypeNOLabel.textColor = [UIColor brownColor];
        _orderPeopleCountLabel.hidden = YES;
    }
    
    NSString *goodsIconUrl = [NSString new];
    goodsIconUrl = [order.orderGoodsArray[0] valueForKey:@"icon"];
    _orderGoodsIconVIew.image = [UIImage imageNamed:goodsIconUrl];
    _orderIDLabel.text = order.orderID;
    _orderTimeLabel.text = order.orderTime;
    _orderGoodsCountLabel.text = [NSString stringWithFormat:@"%i", order.orderGoodsCount];
    _orderPriceLabel.text = [NSString stringWithFormat:@"￥%0.2f", order.orderSalePrice];
    
    if (order.orderStatus == NonPayment) {
        _orderStatusIconView.image = [UIImage imageNamed:@"unpayment"];
    } else if (order.orderStatus == HaveBeenPaid) {
        _orderStatusIconView.image = [UIImage imageNamed:@"havebeenpaid"];
    } else {
        _orderStatusIconView.image = [UIImage imageNamed:@"canceled"];
    }
}

@end
