//
//  CustomAlertViewController.m
//  AnimationTools
//
//  Created by Tianyu on 14/10/29.
//  Copyright (c) 2014年 com.hoolai.lepaoBPM. All rights reserved.
//

#import "CustomAlertViewController.h"
#import "CustomAlertViewManager.h"
#import "SCLAlertView.h"

@interface CustomAlertViewController ()<UITextFieldDelegate>

@end

@implementation CustomAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"AlertView";
    // Do any additional setup after loading the view from its nib.
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

#pragma mark - Click Systom Buttons

- (IBAction)clickOneBtn:(id)sender
{
    [[CustomAlertViewManager sharedInstance] showOneBtnAlertViewWithMessage:@"一个按钮" cancelCompletionBlock:^{
        
        NSLog(@"按钮被点击");
        
    }];
}

- (IBAction)clickTwoBtn:(id)sender
{
    [[CustomAlertViewManager sharedInstance]showTwoBtnAlertViewWithMessage:@"两个按钮" sureCompletionBlock:^{
        
        NSLog(@"确定被点击");
        
    } cancelCompletionBlock:^{
        
        NSLog(@"取消被点击");
        
    }];

}

- (IBAction)clickNoBtn:(id)sender
{
    [[CustomAlertViewManager sharedInstance] showNoBtnAlertViewWithMessage:@"这是一个没有按钮的提示框\n三秒后会消失 或者 点击屏幕任意位置消失\n带你装逼带你飞~"];
}

#pragma mark - Click Custom Buttons

- (IBAction)clickSuccessBtn:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    [alert addButton:@"确定" actionBlock:nil];
    
    alert.soundURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/right_answer.mp3", [[NSBundle mainBundle] resourcePath]]];
    
    [alert showSuccess:self title:@"提示" subTitle:@"成功" closeButtonTitle:nil duration:0.0f];
}

- (IBAction)clickErrorBtn:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    [alert showError:self title:@"提示" subTitle:@"出错" closeButtonTitle:@"确定" duration:0.0f];
}

- (IBAction)clickNoticeBtn:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    [alert showNotice:self title:@"提示" subTitle:@"这是一个提示" closeButtonTitle:@"确定" duration:0.0f];
}

- (IBAction)clickWarningBtn:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    [alert showWarning:self title:@"警告" subTitle:@"装逼挨雷劈！" closeButtonTitle:@"确定" duration:0.0f];
}

- (IBAction)clickInfoBtn:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    alert.shouldDismissOnTapOutside = YES; // 点击周围 隐藏提示框
    
    [alert showInfo:self title:@"详情" subTitle:@"点击空白区域也可让本大爷消失" closeButtonTitle:@"确定" duration:0.0f];
}

- (IBAction)clickEditBtn:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    UITextField *textField = [alert addTextField:@"请输入昵称"];
    textField.delegate = self;
    
    [alert addButton:@"确定" actionBlock:^(void) {
        NSLog(@"Text value: %@", textField.text);
    }];
    
    [alert showEdit:self title:@"提示" subTitle:@"请输入要修改的昵称" closeButtonTitle:@"取消" duration:0.0f];
}

- (IBAction)clickAdvancedBtn:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    [alert addButton:@"First Button" target:self selector:@selector(firstButton)];
    
    [alert addButton:@"Second Button" actionBlock:^(void) {
        NSLog(@"Second button tapped");
    }];
    
    UITextField *textField = [alert addTextField:@"Enter your name"];
    
    [alert addButton:@"Show Name" actionBlock:^(void) {
        NSLog(@"Text value: %@", textField.text);
    }];
    
    alert.attributedFormatBlock = ^NSAttributedString* (NSString *value)
    {
        NSMutableAttributedString *subTitle = [[NSMutableAttributedString alloc]initWithString:value];
        
        NSRange redRange = [value rangeOfString:@"Attributed" options:NSCaseInsensitiveSearch];
        [subTitle addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:redRange];
        
        NSRange greenRange = [value rangeOfString:@"successfully" options:NSCaseInsensitiveSearch];
        [subTitle addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:greenRange];
        
        NSRange underline = [value rangeOfString:@"completed" options:NSCaseInsensitiveSearch];
        [subTitle addAttributes:@{NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle)} range:underline];
        
        return subTitle;
    };
    
    [alert showTitle:self title:@"Congratulations" subTitle:@"Attributed string operation successfully completed." style:Success closeButtonTitle:@"Done" duration:0.0f];
}

- (IBAction)clickDurationBtn:(id)sender
{
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    [alert showNotice:self title:@"提示" subTitle:@"本大爷5秒后消失" closeButtonTitle:nil duration:5.0f];
}


- (void)firstButton
{
    NSLog(@"click firstButton");
}

#pragma mark - textField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
