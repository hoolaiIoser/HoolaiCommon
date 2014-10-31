//
//  UnitTestDemoTests.m
//  UnitTestDemoTests
//
//  Created by leslie_home on 14/10/30.
//  Copyright (c) 2014年 hoolai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TestTools.h"

@interface UnitTestDemoTests : XCTestCase
@property (nonatomic,strong)TestTools * tools_Obj;
@end

@implementation UnitTestDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.tools_Obj = [[TestTools alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];

}

- (void)test1
{
    XCTAssertEqual([_tools_Obj testMethod1], 28,@"");
}

- (void)testExample {
    // This is an example of a functional test case.

    /**
     *  常用的断言
     */

    XCTAssert(1>2, @"不通过");

    XCTAssertEqual([_tools_Obj testMethod1], 30, @"应该等于%@",@"28"); //测试等于

    
    XCTAssertNotEqual([_tools_Obj testMethod1], 1000,@"应该是 %d",[_tools_Obj testMethod1]);   //测试不等于

    XCTAssertEqualObjects(@([_tools_Obj testMethod1]), @28,@"应该等于%@",@28);

    XCTAssertEqualWithAccuracy(10, 13, 2,@"精度超过");   //测试精度

    XCTAssertNotEqualWithAccuracy(10, 15, 3, @"精度范围外"); //测试精度

    XCTAssertNil(nil,@"应该为空");

    XCTAssertNotNil(@([_tools_Obj testMethod1]),@"应该不为空");

    XCTAssertGreaterThan(3,2, @"应该大于");

    XCTAssertGreaterThanOrEqual(3, 3,@"应该大于等于");

    XCTAssertLessThan(2, 3,@"应该小于");

    XCTAssertLessThanOrEqual(2,2,@"应该小于等于");


    /**
     *  其他不常用的断言
     */

//    XCTAssertThrows(expression, ...)
//    XCTAssertThrowsSpecific(expression, exception_class, ...)
//    XCTAssertThrowsSpecificNamed(expression, exception_class, exception_name, ...)
//    XCTAssertNoThrow(expression, ...)
//    XCTAssertNoThrowSpecific(expression, exception_class, ...)
//    XCTAssertNoThrowSpecificNamed(expression, exception_class, exception_name, ...)
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        [_tools_Obj testMethod1];
    }];
}

- (void)testPerformanceExample2
{
    [self measureBlock:^{
            // Put the code you want to measure the time of here.
            [_tools_Obj testMethod2];
        }];
}

@end
