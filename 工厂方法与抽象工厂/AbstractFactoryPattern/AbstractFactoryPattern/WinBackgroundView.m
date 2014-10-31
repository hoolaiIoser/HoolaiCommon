//
//  WinBackgroundView.m
//  AbstractFactoryPattern
//
//  Created by yingruzhao on 10/23/14.
//  Copyright (c) 2014 Test. All rights reserved.
//

#import "WinBackgroundView.h"

@implementation WinBackgroundView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)init
{
    if ((self = [super init])) {
        self.backgroundColor = [UIColor blueColor];
    }
    
    return self;
}

@end
