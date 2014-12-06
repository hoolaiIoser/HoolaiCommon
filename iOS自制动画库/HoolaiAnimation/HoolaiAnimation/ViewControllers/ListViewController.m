//
//  ListViewController.m
//  HoolaiAnimation
//
//  Created by Tianyu on 14/10/30.
//  Copyright (c) 2014年 com.hoolai. All rights reserved.
//

#import "ListViewController.h"
#import "Canvas.h"
#import "ListTableViewCell.h"

#import "LoadingViewController.h"
#import "CustomAlertViewController.h"
#import "DemonstrationViewController.h"
#import "VCChangeViewController.h"
#import "BezierViewController.h"

@interface ListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *cellTitleAry;

@end

static NSString * const kCellIdentifier = @"ListTableViewCell";

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"列表";
    self.tableView.rowHeight = 79.0f;
    
    UINib *nib = [UINib nibWithNibName:@"ListTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:kCellIdentifier];
    
    self.cellTitleAry = @[@"Loading",@"AlertView",@"PushAnimation",@"ios7Push",@"Bezier"];
    
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

#pragma mark - TableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellTitleAry.count;
}

- (ListTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    [cell loadCustomCellData:[self.cellTitleAry objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell startCanvasAnimation];
    cell.backgroundColor = [UIColor clearColor];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell startCanvasAnimation];
    
    NSString *tempStr = [self.cellTitleAry objectAtIndex:indexPath.row];
    
    UIViewController *viewController = nil;
    
    if ([tempStr isEqualToString:@"Loading"]) {
        
        LoadingViewController *loading = [[LoadingViewController alloc] initWithNibName:@"LoadingViewController" bundle:nil];
        viewController = loading;
    }
    
    if ([tempStr isEqualToString:@"AlertView"]) {
        
        CustomAlertViewController *alert = [[CustomAlertViewController alloc] initWithNibName:@"CustomAlertViewController" bundle:nil];
        viewController = alert;
        
    }
    
    if ([tempStr isEqualToString:@"PushAnimation"]) {
        
        DemonstrationViewController *demonstration = [[DemonstrationViewController alloc] initWithNibName:@"DemonstrationViewController" bundle:nil];
        viewController = demonstration;
        
    }
    
    
    if ([tempStr isEqualToString:@"ios7Push"]) {
        
        VCChangeViewController *vcChange = [[VCChangeViewController alloc] initWithNibName:@"VCChangeViewController" bundle:nil];
        viewController = vcChange;
        
    }
    
    if ([tempStr isEqualToString:@"Bezier"]) {
        BezierViewController *bezier = [[BezierViewController alloc] initWithNibName:@"BezierViewController" bundle:nil];
        viewController = bezier;
    }

    
    if (viewController) {
        [self.navigationController pushViewController:viewController animated:YES];
    }
    
    
}

@end
