//
//  YellowCanvasViewGenerator.m
//  FactoryMethodPattern
//
//  Created by yingruzhao on 10/22/14.
//  Copyright (c) 2014 Test. All rights reserved.
//

#import "YellowCanvasViewGenerator.h"

@implementation YellowCanvasViewGenerator

- (CanvasView *)canvasViewWithFrame:(CGRect)frame
{
    return [[YellowCanvasView alloc] initWithFrame:frame];
}

@end
