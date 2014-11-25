//
//  ViewController.m
//  HoolaiAnimation
//
//  Created by Tianyu on 14/10/29.
//  Copyright (c) 2014年 com.hoolai. All rights reserved.
//

#import "ViewController.h"
#import "ListViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Click Buttons

- (IBAction)clickShowBtn:(id)sender
{
    ListViewController *list = [[ListViewController alloc] initWithNibName:@"ListViewController" bundle:nil];
    [self.navigationController pushViewController:list animated:YES];
}



@end
