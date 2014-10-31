//
//  StyleFactory.m
//  AbstractFactoryPattern
//
//  Created by yingruzhao on 10/23/14.
//  Copyright (c) 2014 Test. All rights reserved.
//

#import "StyleFactory.h"
#import "WinStyleFactory.h"
#import "MacStyleFactory.h"

@implementation StyleFactory

+ (StyleFactory *)factory
{
#if defined (Win_Style)
    return [[WinStyleFactory alloc] init];
    
#elif defined (Mac_Style)
    return [[MacStyleFactory alloc] init];
    
#else
    return nil;
#endif
}

- (UIView *)backgroundView
{
    return nil;
}
- (UIButton *)closeButton
{
    return nil;

}
- (UIToolbar *)toolbar
{
    return nil;
}

@end
