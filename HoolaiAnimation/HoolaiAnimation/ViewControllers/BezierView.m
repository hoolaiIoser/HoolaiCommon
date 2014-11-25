//
//  BezierView.m
//  HoolaiAnimation
//
//  Created by Tianyu on 14/11/15.
//  Copyright (c) 2014年 com.hoolai. All rights reserved.
//

#import "BezierView.h"

@implementation BezierView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    UIColor *color = [UIColor redColor];
    [color set];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineWidth = 5.0f;
    
    bezierPath.lineCapStyle = kCGLineCapRound; // 线条拐角
    bezierPath.lineJoinStyle = kCGLineJoinRound; // 终点处理
    
    // 设置形状的起始点
    [bezierPath moveToPoint:CGPointMake(100, 0)];
    
//    [bezierPath addLineToPoint:CGPointMake(200, 100)];
//    [bezierPath addLineToPoint:CGPointMake(100, 200)];
//    [bezierPath addLineToPoint:CGPointMake(0, 100)];
    
    [bezierPath addCurveToPoint:CGPointMake(100, 200) controlPoint1:CGPointMake(0, 60) controlPoint2:CGPointMake(200, 120)];
    
//    [bezierPath closePath];
    ;
    [bezierPath stroke]; // 绘制空心
    
//    [bezierPath fill]; // 绘制实心
    
}


@end
