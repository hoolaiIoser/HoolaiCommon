//
//  ViewController.h
//  FactoryMethodPattern
//
//  Created by yingruzhao on 10/22/14.
//  Copyright (c) 2014 Test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CanvasView.h"
#import "CanvasViewGenerator.h"

@interface ViewController : UIViewController
{
    CanvasView *canvasView;
}

- (void)loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator;

@end

