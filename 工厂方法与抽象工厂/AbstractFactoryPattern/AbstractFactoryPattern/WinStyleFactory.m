//
//  WinStyleFactory.m
//  AbstractFactoryPattern
//
//  Created by yingruzhao on 10/23/14.
//  Copyright (c) 2014 Test. All rights reserved.
//

#import "WinStyleFactory.h"
#import "WinBackgroundView.h"
#import "WinCloseButton.h"
#import "WinToolBar.h"

@implementation WinStyleFactory

- (UIView *)backgroundView
{
    return [[WinBackgroundView alloc] init];
}
- (UIButton *)closeButton
{
    return [[WinCloseButton alloc] init];
    
}
- (UIToolbar *)toolbar
{
    return [[WinToolBar alloc] init];
}

@end
