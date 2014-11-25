//
//  SwipeUpInteractiveTransition.m
//  HoolaiAnimation
//
//  Created by Tianyu on 14/11/12.
//  Copyright (c) 2014年 com.hoolai. All rights reserved.
//

#import "SwipeUpInteractiveTransition.h"

@interface SwipeUpInteractiveTransition ()

@property (assign, nonatomic) BOOL shouldComplete;
@property (strong, nonatomic) UIViewController *presentingVC;

@end

@implementation SwipeUpInteractiveTransition

- (void)wireToViewController:(UIViewController *)viewController
{
    self.presentingVC = viewController;
    [self preparGestureRecognizerInView:viewController.view];
}

- (void)preparGestureRecognizerInView:(UIView *)view
{
    
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [view addGestureRecognizer:gesture];
    
}

- (CGFloat)completionSpeed
{
    return 1 - self.percentComplete;
}

- (void)handleGesture:(UIPanGestureRecognizer *)gestureRecognizer {
    
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view.superview];
    
    switch (gestureRecognizer.state) {
            
        case UIGestureRecognizerStateBegan:
            // 1. Mark the interacting flag. Used when supplying it in delegate.
            self.interacting = YES;
            [self.presentingVC dismissViewControllerAnimated:YES completion:nil];
            break;
            
        case UIGestureRecognizerStateChanged: {
            // 2. Calculate the percentage of guesture
            CGFloat fraction = translation.y / 400.0;
            //Limit it between 0 and 1
            fraction = fminf(fmaxf(fraction, 0.0), 1.0);
            self.shouldComplete = (fraction > 0.5);
            
            [self updateInteractiveTransition:fraction];
            break;
        }
            
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled: {
            // 3. Gesture over. Check if the transition should happen or not
            self.interacting = NO;
            if (!self.shouldComplete || gestureRecognizer.state == UIGestureRecognizerStateCancelled) {
                [self cancelInteractiveTransition];
            } else {
                [self finishInteractiveTransition];
            }
            break;
        }
            
        default:
            break;
    }
}

/*
 
 1.我们设定了一个BOOL变量来表示是否处于切换过程中。这个布尔值将在监测到手势开始时被设置，我们之后会在调用返回这个InteractiveTransition的时候用到。
 
 2.计算百分比，我们设定了向下划动400像素或以上为100%，每次手势状态变化时根据当前手势位置计算新的百分比，结果被限制在0～1之间。然后更新InteractiveTransition的百分数。
 
 3.手势结束时，把正在切换的标设置回NO，然后进行判断。
   在2中我们设定了手势距离超过设定一半就认为应该结束手势，否则就应该返回原来状态。在这里使用其进行判断，已决定这次transition是否应该结束。
 
 */

@end
