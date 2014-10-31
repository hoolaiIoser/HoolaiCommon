//
//  MacStyleFactory.m
//  AbstractFactoryPattern
//
//  Created by yingruzhao on 10/23/14.
//  Copyright (c) 2014 Test. All rights reserved.
//

#import "MacStyleFactory.h"
#import "MacBackgroundView.h"
#import "MacCloseButton.h"
#import "MacToolBar.h"

@implementation MacStyleFactory

- (UIView *)backgroundView
{
    return [[MacBackgroundView alloc] init];
}
- (UIButton *)closeButton
{
    return [[MacCloseButton alloc] init];
    
}
- (UIToolbar *)toolbar
{
    return [[MacToolBar alloc] init];
}

@end
