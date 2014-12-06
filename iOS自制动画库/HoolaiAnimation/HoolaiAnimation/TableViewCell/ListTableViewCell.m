//
//  ListTableViewCell.m
//  HoolaiAnimation
//
//  Created by Tianyu on 14/10/30.
//  Copyright (c) 2014年 com.hoolai. All rights reserved.
//

#import "ListTableViewCell.h"

@implementation ListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)loadCustomCellData:(NSString *)str
{
    self.titleLabel.text = str;
}

@end
