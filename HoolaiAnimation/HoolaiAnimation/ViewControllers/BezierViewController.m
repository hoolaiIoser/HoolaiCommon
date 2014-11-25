//
//  BezierViewController.m
//  HoolaiAnimation
//
//  Created by Tianyu on 14/11/15.
//  Copyright (c) 2014年 com.hoolai. All rights reserved.
//

#import "BezierViewController.h"
#import "BezierView.h"

@interface BezierViewController ()

@end

@implementation BezierViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    BezierView *view = [[BezierView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    view.backgroundColor = [UIColor clearColor];
    view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    [self.view addSubview:view];
    
    UIView *n_view  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    n_view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:n_view];
    [self doAnimation:n_view];
    
    
}

- (void)doAnimation:(UIView *)view
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 10.5f;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount = HUGE_VALF;// repeat forever
    animation.calculationMode = kCAAnimationCubicPaced;
    
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, 0, 200);
    
    //增加4个二阶贝塞尔曲线
    CGPathAddQuadCurveToPoint(curvedPath, NULL, 50, 150, 100, 200);
    CGPathAddQuadCurveToPoint(curvedPath, NULL, 150, 150, 200, 200);
    CGPathAddQuadCurveToPoint(curvedPath, NULL, 250, 150, 300, 200);
    CGPathAddQuadCurveToPoint(curvedPath, NULL, 310, 150, 320, 200);
    
    animation.path = curvedPath;
    
    [view.layer addAnimation:animation forKey:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
