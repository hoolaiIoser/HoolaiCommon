//
//  TouchIDViewController.m
//  HealthKitTest
//
//  Created by Tianyu on 14/11/21.
//  Copyright (c) 2014年 com.hoolai. All rights reserved.
//

#import "TouchIDViewController.h"
#import "ViewController.h"
@import LocalAuthentication;

@interface TouchIDViewController ()

@end

@implementation TouchIDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)clickOpenBtn:(id)sender
{
    
    LAContext *context = [[LAContext alloc] init];
    NSError *error;
    
    if (![context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        
        NSLog(@"===%@",error);
        
    }
    
    [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"指纹识别" reply:^(BOOL success, NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (success) {
                
                ViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"vce"];

                [self presentViewController:viewController animated:YES completion:nil];
                
            } else {
            
                NSLog(@"---%@",error);
                
            }
            
        });
        
    }];
    
    
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
