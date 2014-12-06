//
//  CustomAlertViewManager.h
//  lepaoBPM
//
//  Created by Tianyu on 14-10-14.
//  Copyright (c) 2014年 com.hoolai.lepaoBPM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomAlertViewManager : NSObject

+ (id)sharedInstance;

- (void)showNoBtnAlertViewWithMessage:(NSString *)message;

- (void)showTwoBtnAlertViewWithMessage:(NSString *)message
                   sureCompletionBlock:(void(^)())sBlock cancelCompletionBlock:(void(^)())cBlock;

- (void)showOneBtnAlertViewWithMessage:(NSString *)message cancelCompletionBlock:(void(^)())cBlock;

@end
