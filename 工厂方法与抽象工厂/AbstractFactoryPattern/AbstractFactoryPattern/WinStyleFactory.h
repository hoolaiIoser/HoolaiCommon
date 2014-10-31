//
//  WinStyleFactory.h
//  AbstractFactoryPattern
//
//  Created by yingruzhao on 10/23/14.
//  Copyright (c) 2014 Test. All rights reserved.
//

#import "StyleFactory.h"

@interface WinStyleFactory : StyleFactory

- (UIView *)backgroundView;
- (UIButton *)closeButton;
- (UIToolbar *)toolbar;

@end
