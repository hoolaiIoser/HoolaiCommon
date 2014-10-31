//
//  ViewController.m
//  AbstractFactoryPattern
//
//  Created by yingruzhao on 10/23/14.
//  Copyright (c) 2014 Test. All rights reserved.
//

#import "ViewController.h"
#import "StyleFactory.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    StyleFactory *factory = [StyleFactory factory];
    UIView *backgroundView = [factory backgroundView];
    backgroundView.frame = self.view.bounds;
    [self.view addSubview:backgroundView];
    
    UIButton *closeButton = [factory closeButton];
    UIToolbar *toolBar = [factory toolbar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
