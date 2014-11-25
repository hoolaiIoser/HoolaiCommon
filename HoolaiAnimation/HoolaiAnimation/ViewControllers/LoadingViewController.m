//
//  LoadingViewController.m
//  AnimationTools
//
//  Created by Tianyu on 14/10/28.
//  Copyright (c) 2014年 com.hoolai.lepaoBPM. All rights reserved.
//

#import "LoadingViewController.h"

#import "CustomLoadingView.h"

#import "ImageLoadingView.h"

@interface LoadingViewController ()

@property (strong, nonatomic) ImageLoadingView *imageLoading;

@end

@implementation LoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Loading";
    
    self.imageLoading = [[ImageLoadingView alloc] initWithFrame:CGRectMake(0, 0, 57, 57)];
}




- (IBAction)clickCustomLoading:(id)sender
{
    [[CustomLoadingView sharedInstance] loadingShowInView:self.view];
    
    [self performSelector:@selector(clickStopCustomLoading) withObject:nil afterDelay:3];
    
}

- (void)clickStopCustomLoading
{
    [[CustomLoadingView sharedInstance] hiddenView];
}




- (IBAction)clickImageLoading:(id)sender
{
    self.imageLoading.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
    [self.view addSubview:self.imageLoading];
    [self.imageLoading showWhiteLoadingView];
    
}

- (IBAction)clickStopImageLoading:(id)sender
{
    [self.imageLoading stopLoadingView];
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
