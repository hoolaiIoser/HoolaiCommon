//
//  GreenCanvasViewGenerator.m
//  FactoryMethodPattern
//
//  Created by yingruzhao on 10/22/14.
//  Copyright (c) 2014 Test. All rights reserved.
//

#import "GreenCanvasViewGenerator.h"

@implementation GreenCanvasViewGenerator

- (CanvasView *)canvasViewWithFrame:(CGRect)frame
{
    return [[GreenCanvasView alloc] initWithFrame:frame];
}

@end
