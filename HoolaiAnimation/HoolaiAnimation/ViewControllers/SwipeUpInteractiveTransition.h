//
//  SwipeUpInteractiveTransition.h
//  HoolaiAnimation
//
//  Created by Tianyu on 14/11/12.
//  Copyright (c) 2014年 com.hoolai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeUpInteractiveTransition : UIPercentDrivenInteractiveTransition

@property (assign, nonatomic) BOOL interacting;

- (void)wireToViewController:(UIViewController *)viewController;

@end
