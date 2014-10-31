//
//  TestTools.m
//  UnitTestDemo
//
//  Created by leslie_home on 14/10/30.
//  Copyright (c) 2014年 hoolai. All rights reserved.
//

#import "TestTools.h"

@implementation TestTools

- (id)init
{
    self = [super init];
    if (self) {
        self.sortArr = [[NSArray alloc] initWithObjects:@"1",@"3",@"4",@"7",@"8",@"2",@"6",@"5",@"13",@"15",@"12",@"20",@"28",@"",nil];
    }
    return self;
}

- (int)testMethod1
{
    NSComparator cmptr = ^(id obj1, id obj2){
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }

        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    };


    //排序前
    NSMutableString *outputBefore = [[NSMutableString alloc] init];
    for(NSString *str in self.sortArr){
        [outputBefore appendFormat:@"%@",str];
    }

    NSLog(@"排序前:%@",outputBefore);

    NSArray *array = [self.sortArr sortedArrayUsingComparator:cmptr];

    NSMutableString *outputAfter = [[NSMutableString alloc] init];
    for(NSString *str in array){
        [outputAfter appendFormat:@"%@",str];
    }
    NSLog(@"排序后:%@",outputAfter);



    return [[array lastObject] intValue];
}

- (int)testMethod2
{
    NSAssert(2>3, @"1+1=2");

    return 0;
}
@end
