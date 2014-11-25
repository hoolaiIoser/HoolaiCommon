//
//  DemonstrationViewController.m
//  HoolaiAnimation
//
//  Created by Tianyu on 14/10/30.
//  Copyright (c) 2014年 com.hoolai. All rights reserved.
//

#import "DemonstrationViewController.h"
#import "PushTempViewController.h"


@interface DemonstrationViewController ()

@property (strong, nonatomic) NSArray *btnAry;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation DemonstrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Push动画效果";
    
    self.btnAry = @[@"Push",@"Fade",@"MoveIn",@"Reveal",
                    @"flip",
                    @"alignedFlip",
                    @"oglFlip",
                    @"cube",
                    @"alignedCube",
                    @"pageCurl",
                    @"pageUnCurl",
                    @"rippleEffect",
                    @"suckEffect",
                    @"cameraIris",
                    @"cameraIrisHollowOpen",
                    @"cameraIrisHollowClose",
                    @"rotate",
                    @"spewEffect",
                    @"genieEffect",
                    @"unGenieEffect",
                    @"twist",
                    @"swirl",
                    @"charminUltra",
                    @"reflection",
                    @"zoomyIn",
                    @"zoomyOut ",
                    @"mapCurlv",
                    @"mapUnCurl",
                    @"oglApplicationSuspend",
                    @"cameraIrisHollow",];
    
    int height = (self.btnAry.count%4 > 0 ? (int)self.btnAry.count/4+1 : (int)self.btnAry.count/4);
    self.scrollView.contentSize = CGSizeMake(320, height*(60+16*2)+16*2);
    
    for (int i = 0; i < self.btnAry.count; i++) {
        
        CGRect btnFrame = CGRectMake(16+(i%4)*(60+16), 16+(i/4)*(36+60), 60, 60);
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor whiteColor];
        btn.layer.cornerRadius = 10;
        [btn setTitle:[self.btnAry objectAtIndex:i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:9.0f];
        btn.titleLabel.numberOfLines = 0;
        btn.showsTouchWhenHighlighted = YES;
        btn.tag = i;
        btn.frame = btnFrame;
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:btn];
        
    }
    
    
}

- (void)clickBtn:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    
    NSString *tempStr = [self.btnAry objectAtIndex:btn.tag];

    PushTempViewController *temoViewController = [[PushTempViewController alloc] initWithNibName:@"PushTempViewController" bundle:nil];
    temoViewController.dataAry = self.btnAry;
    temoViewController.index = (int)btn.tag;
    
    CATransition *transition = [CATransition animation];
    
    transition.duration = 0.3f;
    
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self showTransition:transition type:tempStr];
    
    transition.subtype = kCATransitionFromRight;
    
    transition.delegate = self;
    
    [self.view.layer addAnimation:transition forKey:nil];
    [self addChildViewController:temoViewController];
    [self.view addSubview:temoViewController.view];
    
    self.navigationController.navigationBar.hidden = YES;
    
}

- (void)showTransition:(CATransition *)transition type:(NSString *)typeStr
{
    if ([typeStr isEqualToString:@"Push"]) {
        
        transition.type = kCATransitionPush;
        
    } else if ([typeStr isEqualToString:@"Fade"]) {
        
        transition.type = kCATransitionFade;
        
    } else if ([typeStr isEqualToString:@"MoveIn"]) {
        
        transition.type = kCATransitionMoveIn;
        
    } else if ([typeStr isEqualToString:@"Reveal"]) {
        
        transition.type = kCATransitionReveal;
        
    } else {
        
        transition.type = typeStr;
        
    }
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

@end
