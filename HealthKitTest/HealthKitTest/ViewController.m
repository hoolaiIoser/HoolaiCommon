//
//  ViewController.m
//  HealthKitTest
//
//  Created by Tianyu on 14/11/21.
//  Copyright (c) 2014年 com.hoolai. All rights reserved.
//

#import "ViewController.h"
#import <HealthKit/HealthKit.h>

#define NSStringFormat(number) [NSString stringWithFormat:@"%@g",number]

@interface ViewController ()<UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *currentDataLabel;

@property (strong, nonatomic) HKHealthStore *healthStore;

@property (assign, nonatomic) double weight; // 体重 单位:g

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([HKHealthStore isHealthDataAvailable]) {
        
        [self requestAuthorization];
        
    } else {
        
        self.currentDataLabel.text = @"你手机不支持健康";
        
    }

}

#pragma mark - 读取

- (void)requestAuthorization
{
    NSSet *shareType = [NSSet setWithObject:[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass]];
    
//    NSSet *birthday = [NSSet setWithObject:[HKCharacteristicType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierDateOfBirth]];
    
    self.healthStore = [[HKHealthStore alloc] init];
    
    [self.healthStore requestAuthorizationToShareTypes:shareType
                                             readTypes:shareType
                                            completion:^(BOOL success, NSError *error) {
        
                                                if (!success) {
                                                    
                                                    self.currentDataLabel.text = @"请允许本程式读取/写入体重信息";
                                                    return;
                                                    
                                                } else {
                                                    
                                                    [self setWeightInit];
                                                    
                                                }
                                                
    }];
}

- (void)setWeightInit
{
    HKQuantityType *type = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass];
    
    [self fetchQuantity:type completionHandler:^(HKStatistics *result, NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (error || result.sources.count == 0) {
                
                self.weight = 0;
                self.currentDataLabel.text = NSStringFormat(@(self.weight));
                
            } else {
                
                /*
                 * HKQuantityAggregationStyleCumulative累计类型 步数，距离，肺活量，营养信息，燃烧卡路里等
                 
                 
                 * HKQuantityAggregationStyleDiscrete离散类型 体重，心脏率，温度，和呼吸速率等
                 * 经过一段时间，离散样本 可能会趋于平均
                 */
                HKQuantity *resultQuantity = type.aggregationStyle == HKQuantityAggregationStyleCumulative ? result.sumQuantity : result.averageQuantity;
                
                HKUnit *unit = [self defaultUnitForQuantityType:type];
                
                self.weight = [resultQuantity doubleValueForUnit:unit];
                self.currentDataLabel.text = NSStringFormat(@(self.weight));
            }
            
        });
        
    }];
}


- (HKUnit *)defaultUnitForQuantityType:(HKQuantityType *)type
{
    NSString *identifier = type.identifier;
    
    if ([identifier isEqualToString:HKQuantityTypeIdentifierBodyMass]) {
        
        return [HKUnit gramUnit];
        
    }
    
    return nil;
    
}

- (void)fetchQuantity:(HKQuantityType *)type
    completionHandler:(void (^)(HKStatistics *result, NSError *error))completionHandler
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDate *now = [NSDate date];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:now];
    NSDate *startDate = [calendar dateFromComponents:components];
    NSDate *endDate = [calendar dateByAddingUnit:NSCalendarUnitDay value:1 toDate:startDate options:0];
    
    
    
    
    NSPredicate *predicate = [HKQuery predicateForSamplesWithStartDate:startDate
                                                               endDate:endDate
                                                               options:HKQueryOptionStrictStartDate];
    
    HKStatisticsOptions options = type.aggregationStyle == HKQuantityAggregationStyleCumulative ? HKStatisticsOptionCumulativeSum : HKStatisticsOptionDiscreteAverage;
    HKStatisticsQuery *query = [[HKStatisticsQuery alloc] initWithQuantityType:type
                                                       quantitySamplePredicate:predicate
                                                                       options:options
                                                             completionHandler:
                                ^(HKStatisticsQuery *query, HKStatistics *result, NSError *error) {
                                    if (completionHandler) {
                                        
                                        if (error) {
                                            completionHandler(nil, error);
                                        }
                                        else {
                                            completionHandler(result, error);
                                        }
                                    }
                                }];
    
    [self.healthStore executeQuery:query];
}

#pragma mark - 写入

- (IBAction)clickWriteData:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:@"请输入体重（单位：KG）"
                                                   delegate:self
                                          cancelButtonTitle:@"取消"
                                          otherButtonTitles:@"确定", nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        
        self.weight = [[alertView textFieldAtIndex:0].text doubleValue] * 1000;
        [self saveWeightIntoHealthStore:self.weight];

    }
    
}

- (void)saveWeightIntoHealthStore:(double)weight
{
    HKUnit *unit = [HKUnit gramUnit];
    HKQuantity *quantity = [HKQuantity quantityWithUnit:unit doubleValue:weight];
    HKQuantityType *type = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass];
    
    NSDate *now = [NSDate date];
    
    HKQuantitySample *sample = [HKQuantitySample quantitySampleWithType:type
                                                               quantity:quantity
                                                              startDate:now
                                                                endDate:now];
    
    
    [self.healthStore saveObject:sample withCompletion:^(BOOL success, NSError *error) {
       
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (!success) {
                
                self.currentDataLabel.text = @"储存失败";
                
            } else {
                
                self.currentDataLabel.text = NSStringFormat(@(self.weight));
                
            }

        });
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
