//
//  CustomAlertView.h
//  lepaoBPM
//
//  Created by Tianyu on 14-10-14.
//  Copyright (c) 2014年 com.hoolai.lepaoBPM. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    
    NoBtnType,
    OneBtnType,
    TwoBtnType
} AlertViewType;

typedef void(^SureCompletionBlock)(void);
typedef void(^CancelCompletionBlock)(void);

@interface CustomAlertView : UIView<UIAlertViewDelegate>

@property (assign, nonatomic) AlertViewType alertViewType;
@property (copy, nonatomic) SureCompletionBlock sureCompletionBlock;
@property (copy, nonatomic) CancelCompletionBlock cancelComletionBlock;

- (id)initWithMessage:(NSString *)text;
- (void)showBgView;

@end
