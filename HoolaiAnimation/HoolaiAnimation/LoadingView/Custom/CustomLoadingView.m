//
//  CustomLoadingView.m
//  lepaoBPM
//
//  Created by Tianyu on 14-10-13.
//  Copyright (c) 2014年 com.hoolai.lepaoBPM. All rights reserved.
//

#import "CustomLoadingView.h"
#import "LLARingSpinnerView.h"

@interface CustomLoadingView ()

@property (strong, nonatomic) LLARingSpinnerView *spinnerView;
@property (strong, nonatomic) UIView *bgView;

@end

@implementation CustomLoadingView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (id)sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    if (self = [super init]) {
        if (!self.spinnerView) {
            
            self.bgView = [[UIView alloc] initWithFrame:CGRectZero];
            self.bgView.layer.masksToBounds = YES;
            self.bgView.layer.cornerRadius = 10;
            self.bgView.bounds = CGRectMake(0, 0, 60, 60);
            self.bgView.backgroundColor = [UIColor colorWithRed:228/255.0 green:228/255.0 blue:228/255.0 alpha:1];
            
            
            self.spinnerView = [[LLARingSpinnerView alloc] initWithFrame:CGRectZero];
            self.spinnerView.bounds = CGRectMake(0, 0, 40, 40);
            self.spinnerView.tintColor = [UIColor colorWithRed:215.f/255 green:49.f/255 blue:69.f/255 alpha:1];
        }
        
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}


- (void)loadingShowInView:(UIView *)superView
{
    
    self.frame = superView.frame;
    
    self.bgView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    [self addSubview:self.bgView];
    
    self.spinnerView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    [self addSubview:self.spinnerView];
    
    [superView addSubview:self];
    [superView bringSubviewToFront:self];
    
    [self.spinnerView startAnimating];
    
}

- (void)hiddenView
{
    [self.spinnerView stopAnimating];
    [self removeFromSuperview];
}


@end
