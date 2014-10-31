//
//  YellowCanvasViewGenerator.h
//  FactoryMethodPattern
//
//  Created by yingruzhao on 10/22/14.
//  Copyright (c) 2014 Test. All rights reserved.
//

#import "CanvasViewGenerator.h"
#import "YellowCanvasView.h"

@interface YellowCanvasViewGenerator : CanvasViewGenerator

- (CanvasView *)canvasViewWithFrame:(CGRect)frame;

@end
