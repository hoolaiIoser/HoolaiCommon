//
//  ViewController.m
//  FactoryMethodPattern
//
//  Created by yingruzhao on 10/22/14.
//  Copyright (c) 2014 Test. All rights reserved.
//

#import "ViewController.h"
#import "YellowCanvasViewGenerator.h"
#import "GreenCanvasViewGenerator.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CanvasViewGenerator *canvasViewGenerator = [[YellowCanvasViewGenerator alloc] init];
    [self loadCanvasViewWithGenerator:canvasViewGenerator];
    
//    CanvasViewGenerator *canvasViewGenerator = [[GreenCanvasViewGenerator alloc] init];
//    [self loadCanvasViewWithGenerator:canvasViewGenerator];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator
{
    [canvasView removeFromSuperview];
    canvasView = [generator canvasViewWithFrame:self.view.bounds];
    [self.view addSubview:canvasView];
}

@end
