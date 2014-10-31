//
//  GreenCanvasView.m
//  FactoryMethodPattern
//
//  Created by yingruzhao on 10/22/14.
//  Copyright (c) 2014 Test. All rights reserved.
//

#import "GreenCanvasView.h"

@implementation GreenCanvasView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        self.backgroundColor = [UIColor greenColor];
    }
    
    return self;
}

@end
