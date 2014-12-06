//
//  VCChangeModelViewController.h
//  HoolaiAnimation
//
//  Created by Tianyu on 14/11/12.
//  Copyright (c) 2014年 com.hoolai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VCChangeModelViewController;
@protocol ModelViewDelegate <NSObject>

- (void)modelViewControllerDidClickedDismissButton:(VCChangeModelViewController *)viewController;

@end

@interface VCChangeModelViewController : UIViewController

@property (weak, nonatomic) id<ModelViewDelegate>delegate;

@end
