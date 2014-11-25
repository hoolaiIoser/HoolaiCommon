//
//  ImageLoadingView.m
//  AnimationTools
//
//  Created by Tianyu on 14/10/28.
//  Copyright (c) 2014年 com.hoolai.lepaoBPM. All rights reserved.
//

#import "ImageLoadingView.h"

#define kLoadingImageWidth  57.0f

#define kLoadImageName @"LoadImage.bundle/loading_img.png"
#define kWhiteLoadBgImageName @"LoadImage.bundle/white_loading_bg.png"
#define kGrayLoadBgImageName @"LoadImage.bundle/gray_loading_bg.png"


@interface ImageLoadingView ()

@property (strong, nonatomic) UIView *loadView;
@property (strong, nonatomic) UIImageView *loadImgView;
@property (strong, nonatomic) UIImageView *loadBgImgView;

@end

@implementation ImageLoadingView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        // Initialization code
        
        self.loadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.loadView.backgroundColor = [UIColor clearColor];
        self.loadImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kLoadingImageWidth, kLoadingImageWidth)];
        [self.loadImgView setImage:[UIImage imageNamed:kLoadImageName]];
        self.loadBgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kLoadingImageWidth, kLoadingImageWidth)];
        
        
        [self addSubview:self.loadView];
        [self.loadView addSubview:self.loadBgImgView];
        [self.loadView addSubview:self.loadImgView];
        
    }
    return self;
}

-(void)showWhiteLoadingView
{
    [self.loadBgImgView setImage:[UIImage imageNamed:kWhiteLoadBgImageName]];
    [self startAnimation];
}

- (void)showGrayLoadingView
{
    [self.loadBgImgView setImage:[UIImage imageNamed:kGrayLoadBgImageName]];
    [self startAnimation];
}

-(void)stopLoadingView
{
    
    [self removeFromSuperview];
    [self stopAnimation];
}


- (void)startAnimation
{
    CALayer *animatedLayer = self.loadView.layer;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.duration = 1.5; //一次旋转的时间
    animation.toValue = [NSNumber numberWithFloat:2 * M_PI];
    animation.repeatCount = NSIntegerMax; //旋转的次数
    [animatedLayer addAnimation:animation forKey:@"animation"];
}

- (void)stopAnimation
{
    [self.loadView.layer removeAllAnimations];
}

@end
