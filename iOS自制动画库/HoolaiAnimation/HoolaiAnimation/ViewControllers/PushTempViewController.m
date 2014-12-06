//
//  PushTempViewController.m
//  HoolaiAnimation
//
//  Created by Tianyu on 14/10/30.
//  Copyright (c) 2014年 com.hoolai. All rights reserved.
//

#import "PushTempViewController.h"

@interface PushTempViewController ()

@end

@implementation PushTempViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
- (void)setDataAry:(NSArray *)dataAry
{
    _dataAry = dataAry;
}
- (void)setIndex:(int)index
{
    _index = index;
}

- (IBAction)clickBackBtn:(id)sender
{
    if (self.dataAry && self.dataAry.count > 0) {
        
        [self.view.superview.layer removeAllAnimations];
        
        CATransition *transition = [CATransition animation];
        
        transition.duration = 0.3f;
        
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        [self showTransition:transition type:[self.dataAry objectAtIndex:self.index]];
        
        transition.subtype = kCATransitionFromLeft;
        
        transition.delegate = self;
        
        [self.view.superview.layer addAnimation:transition forKey:nil];
        
        self.parentViewController.navigationController.navigationBar.hidden = NO;
        
        
        [self removeFromParentViewController];
        [self.view removeFromSuperview];
        
    }

}

- (void)showTransition:(CATransition *)transition type:(NSString *)typeStr
{
    if ([typeStr isEqualToString:@"Push"]) {
        
        transition.type = kCATransitionPush;
        
    } else if ([typeStr isEqualToString:@"Fade"]) {
        
        transition.type = kCATransitionFade;
        
    } else if ([typeStr isEqualToString:@"MoveIn"]) {
        
        transition.type = kCATransitionMoveIn;
        
    } else if ([typeStr isEqualToString:@"Reveal"]) {
        
        transition.type = kCATransitionReveal;
        
    } else {
        
        transition.type = typeStr;
        
    }
}




@end
