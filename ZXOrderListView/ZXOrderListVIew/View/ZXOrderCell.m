//
//  ZXOrderCell.m
//  ZXOrderListView
//
//  Created by Xiang on 16/2/27.
//  Copyright © 2016年 周想. All rights reserved.
//

#import "ZXOrderCell.h"

@interface ZXOrderCell ()

@property (weak, nonatomic) IBOutlet UILabel *orderTypeNOLabel;
@property (weak, nonatomic) IBOutlet UIImageView *orderGoodsIconVIew;
@property (weak, nonatomic) IBOutlet UILabel *orderIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderGoodsCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderPriceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *orderStatusIconView;

@end

@implementation ZXOrderCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
