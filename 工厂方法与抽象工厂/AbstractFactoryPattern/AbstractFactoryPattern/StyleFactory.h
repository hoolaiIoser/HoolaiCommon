//
//  StyleFactory.h
//  AbstractFactoryPattern
//
//  Created by yingruzhao on 10/23/14.
//  Copyright (c) 2014 Test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define Mac_style

@interface StyleFactory : NSObject

+ (StyleFactory *)factory;

- (UIView *) backgroundView;
- (UIButton *) closeButton;
- (UIToolbar *) toolbar;

@end
