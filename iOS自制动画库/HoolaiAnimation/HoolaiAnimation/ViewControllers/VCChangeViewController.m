//
//  VCChangeViewController.m
//  HoolaiAnimation
//
//  Created by Tianyu on 14/11/12.
//  Copyright (c) 2014年 com.hoolai. All rights reserved.
//

#import "VCChangeViewController.h"
#import "VCChangeModelViewController.h"
#import "BouncePresentAnimation.h"
#import "NormalDismissAnimation.h"
#import "SwipeUpInteractiveTransition.h"

@interface VCChangeViewController ()<ModelViewDelegate,UIViewControllerTransitioningDelegate>

@property (strong, nonatomic) BouncePresentAnimation *presentAnimation;

@property (strong, nonatomic) NormalDismissAnimation *dismissAnimation;
@property (strong, nonatomic) SwipeUpInteractiveTransition *transitionController;

@end

@implementation VCChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _presentAnimation = [BouncePresentAnimation new];
    
    _dismissAnimation = [NormalDismissAnimation new];
    _transitionController = [SwipeUpInteractiveTransition new];
    
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)clickPresentBtn:(id)sender
{
    VCChangeModelViewController *modelView = [[VCChangeModelViewController alloc] init];
    modelView.delegate = self;
    modelView.transitioningDelegate = self;
    [self.transitionController wireToViewController:modelView];
    [self presentViewController:modelView animated:YES completion:nil];
}

- (void)modelViewControllerDidClickedDismissButton:(VCChangeModelViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    return self.presentAnimation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.dismissAnimation;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
    return self.transitionController.interacting ? self.transitionController : nil;
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
