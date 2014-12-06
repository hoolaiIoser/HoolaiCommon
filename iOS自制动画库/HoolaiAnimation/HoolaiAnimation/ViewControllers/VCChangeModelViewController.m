//
//  VCChangeModelViewController.m
//  HoolaiAnimation
//
//  Created by Tianyu on 14/11/12.
//  Copyright (c) 2014年 com.hoolai. All rights reserved.
//

#import "VCChangeModelViewController.h"

@interface VCChangeModelViewController ()

@end

@implementation VCChangeModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)clickDismissBtn:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(modelViewControllerDidClickedDismissButton:)]) {
        
        [self.delegate modelViewControllerDidClickedDismissButton:self];
        
    }
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
