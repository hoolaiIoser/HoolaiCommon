//
//  CanvasViewGenerator.m
//  FactoryMethodPattern
//
//  Created by yingruzhao on 10/22/14.
//  Copyright (c) 2014 Test. All rights reserved.
//

#import "CanvasViewGenerator.h"

@implementation CanvasViewGenerator

- (CanvasView *)canvasViewWithFrame:(CGRect)frame
{
    return [[CanvasView alloc] initWithFrame:frame];
}

@end
