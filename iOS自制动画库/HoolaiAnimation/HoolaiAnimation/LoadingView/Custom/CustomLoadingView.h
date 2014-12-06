//
//  CustomLoadingView.h
//  lepaoBPM
//
//  Created by Tianyu on 14-10-13.
//  Copyright (c) 2014年 com.hoolai.lepaoBPM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomLoadingView : UIView

+ (id)sharedInstance;

- (void)loadingShowInView:(UIView *)superView;

- (void)hiddenView;

@end
