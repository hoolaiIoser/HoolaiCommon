//
//  CustomAlertViewManager.m
//  lepaoBPM
//
//  Created by Tianyu on 14-10-14.
//  Copyright (c) 2014年 com.hoolai.lepaoBPM. All rights reserved.
//

#import "CustomAlertViewManager.h"
#import "CustomAlertView.h"

@interface CustomAlertViewManager ()

@property (strong, nonatomic) CustomAlertView *customAlertView;

@end

@implementation CustomAlertViewManager

+ (id)sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)showNoBtnAlertViewWithMessage:(NSString *)message
{
    
    self.customAlertView = [[CustomAlertView alloc] initWithMessage:message];
    
    self.customAlertView.alertViewType = NoBtnType;
    
    [self.customAlertView showBgView];
    
}

- (void)showTwoBtnAlertViewWithMessage:(NSString *)message
                   sureCompletionBlock:(void(^)())sBlock cancelCompletionBlock:(void(^)())cBlock
{
    self.customAlertView = [[CustomAlertView alloc] initWithMessage:message];
    
    self.customAlertView.alertViewType = TwoBtnType;
    
    self.customAlertView.sureCompletionBlock = ^{
        sBlock();
    };
    
    self.customAlertView.cancelComletionBlock = ^{
        cBlock();
    };
}

- (void)showOneBtnAlertViewWithMessage:(NSString *)message cancelCompletionBlock:(void(^)())cBlock
{
    self.customAlertView = [[CustomAlertView alloc] initWithMessage:message];
    
    self.customAlertView.alertViewType = OneBtnType;
    
    self.customAlertView.cancelComletionBlock = ^{
        cBlock();
    };
    
}

@end
