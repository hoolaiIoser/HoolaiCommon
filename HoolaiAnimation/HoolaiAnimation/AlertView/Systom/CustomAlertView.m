//
//  CustomAlertView.m
//  lepaoBPM
//
//  Created by Tianyu on 14-10-14.
//  Copyright (c) 2014年 com.hoolai.lepaoBPM. All rights reserved.
//

#import "CustomAlertView.h"

static const CGFloat CSToastMaxWidth            = 0.8;      // 80% of parent view width
static const CGFloat CSToastMaxHeight           = 0.8;      // 80% of parent view height
static const CGFloat CSToastHorizontalPadding   = 10.0;
static const CGFloat CSToastVerticalPadding     = 10.0;
static const CGFloat CSToastCornerRadius        = 10.0;
static const CGFloat CSToastOpacity             = 0.8;
static const CGFloat CSToastFontSize            = 16.0;
static const CGFloat CSToastMaxMessageLines     = 0;

static const CGFloat CSToastShadowOpacity       = 0.8;
static const CGFloat CSToastShadowRadius        = 6.0;
static const CGSize  CSToastShadowOffset        = { 4.0, 4.0 };

@interface CustomAlertView ()
{
    NSString *_message;
}

@property (strong, nonatomic) UIView *bgView;
@property (strong, nonatomic) UIControl *control;


@property (strong, nonatomic) UIAlertView *oneBtnAlert;
@property (strong, nonatomic) UIAlertView *twoBtnAlert;

@end

@implementation CustomAlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithMessage:(NSString *)text
{
    if (self = [super initWithFrame:[UIApplication sharedApplication].keyWindow.bounds]) {
        
        _message = text;
        
    }
    return self;
}

- (void)setAlertViewType:(AlertViewType)alertViewType
{
    _alertViewType = alertViewType;
    
    switch (_alertViewType) {
        case NoBtnType:
        {
            [self addNoBtnAlertViewWithMessage:_message];
        }
            break;
        case OneBtnType:
        {
            [self addOneBtnAlertViewWithMessage:_message];
        }
            break;
        case TwoBtnType:
        {
            [self addTwoBtnAlertViewWithMessage:_message];
        }
            break;
        default:
            break;
    }
}

#pragma mark - 两个按钮的AlertView
- (void)addTwoBtnAlertViewWithMessage:(NSString *)message
{
    self.twoBtnAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [self.twoBtnAlert show];
    
}



#pragma mark - 一个按钮的AlertView
- (void)addOneBtnAlertViewWithMessage:(NSString *)message
{
    self.oneBtnAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [self.oneBtnAlert show];
}


#pragma mark - AlertView Delegete
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView == self.oneBtnAlert) {
        
        if (self.cancelComletionBlock) {
            self.cancelComletionBlock();
        }
        
    } else if (alertView == self.twoBtnAlert) {
        
        if (buttonIndex == 0) {
            if (self.cancelComletionBlock) {
                self.cancelComletionBlock();
            }
        } else {
            if (self.sureCompletionBlock) {
                self.sureCompletionBlock();
            }
        }
    }
}


#pragma mark - 没有按钮的AlertView
- (void)addNoBtnAlertViewWithMessage:(NSString *)message
{
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.bgView.backgroundColor = [UIColor clearColor];
    self.bgView.userInteractionEnabled = YES;
    [[[[UIApplication sharedApplication] delegate] window] addSubview:self.bgView];
    
    self.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin);
    self.layer.cornerRadius = CSToastCornerRadius;
    self.layer.shadowColor = [UIColor colorWithRed:0.035 green:0.000 blue:0.084 alpha:1.000].CGColor;
    self.layer.shadowOpacity = CSToastShadowOpacity;
    self.layer.shadowRadius = CSToastShadowRadius;
    self.layer.shadowOffset = CSToastShadowOffset;
    self.backgroundColor = [[UIColor colorWithRed:0.035 green:0.000 blue:0.084 alpha:1.000] colorWithAlphaComponent:CSToastOpacity];
    
    UILabel *messageLabel = nil;
    messageLabel = [[UILabel alloc] init];
    messageLabel.numberOfLines = CSToastMaxMessageLines;
    messageLabel.font = [UIFont systemFontOfSize:CSToastFontSize];
    messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
    messageLabel.textColor = [UIColor whiteColor];
    messageLabel.backgroundColor = [UIColor clearColor];
    messageLabel.alpha = 1.0;
    messageLabel.text = message;
    
    CGSize maxSizeMessage = CGSizeMake(([UIScreen mainScreen].bounds.size.width * CSToastMaxWidth),
                                       [UIScreen mainScreen].bounds.size.height * CSToastMaxHeight);
    
    CGSize expectedSizeMessage = [message sizeWithFont:messageLabel.font
                                     constrainedToSize:maxSizeMessage
                                         lineBreakMode:messageLabel.lineBreakMode];
    
//    CGRect expectedSizeMessage = [message boundingRectWithSize:messageLabel.frame.size
//                                                       options:NSStringDrawingUsesFontLeading
//                                                    attributes:nil
//                                                       context:nil];
    
    
    messageLabel.frame = CGRectMake(0.0, 0.0, expectedSizeMessage.width, expectedSizeMessage.height);
    
    CGFloat messageWidth, messageHeight, messageLeft, messageTop;
    
    
    messageWidth = messageLabel.bounds.size.width;
    messageHeight = messageLabel.bounds.size.height;
    messageLeft = CSToastHorizontalPadding;
    messageTop = CSToastVerticalPadding;
    
    CGFloat longerWidth = MAX(0, messageWidth);
    CGFloat longerLeft = MAX(0, messageLeft);
    
    CGFloat wrapperWidth = MAX((0 + (CSToastHorizontalPadding * 2)), (longerLeft + longerWidth + CSToastHorizontalPadding));
    CGFloat wrapperHeight = MAX((messageTop + messageHeight + CSToastVerticalPadding), (0 + (CSToastVerticalPadding * 2)));
    
    self.frame = CGRectMake(0.0, 0.0, wrapperWidth, wrapperHeight);
    messageLabel.frame = CGRectMake(messageLeft, messageTop, messageWidth, messageHeight);
    [self addSubview:messageLabel];
    
    self.center = self.bgView.center;
    [self.bgView addSubview:self];
    
    self.bgView.alpha = 0;
    
    self.control = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, self.bgView.frame.size.width, self.bgView.frame.size.height)];
    [self.control addTarget:self action:@selector(hideBgView) forControlEvents:UIControlEventTouchUpInside];
    [[[[UIApplication sharedApplication] delegate] window] addSubview:self.control];
    
}


- (void)showBgView
{
    
    [UIView animateWithDuration:0.2
                          delay:0.0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         self.bgView.alpha = 1.0;
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.2
                                               delay:3.0
                                             options:UIViewAnimationOptionAllowUserInteraction                                          animations:^{
                                                 self.bgView.alpha = 0.0;
                                             } completion:^(BOOL finished) {
                                                 [self.bgView removeFromSuperview];
                                                 [self.control removeFromSuperview];
                                             }];
                     }];
    
    
    
}

- (void)hideBgView
{
    [self.bgView.layer removeAllAnimations];
    self.bgView.alpha = 0.0;
    [self.bgView removeFromSuperview];
    [self.control removeFromSuperview];
}


@end
