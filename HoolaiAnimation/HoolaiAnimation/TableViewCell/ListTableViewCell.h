//
//  ListTableViewCell.h
//  HoolaiAnimation
//
//  Created by Tianyu on 14/10/30.
//  Copyright (c) 2014年 com.hoolai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (void)loadCustomCellData:(NSString *)str;

@end
