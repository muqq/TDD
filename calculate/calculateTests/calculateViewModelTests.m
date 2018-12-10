//
//  calculateViewModelTests.m
//  calculate
//
//  Created by QQ Shih on 2017/4/19.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CalculateViewModel.h"
#import "MockRecordManager.h"

@interface calculateViewModelTests : XCTestCase

@property (nonatomic) CalculateViewModel *viewModel;

@end

@implementation calculateViewModelTests

- (void)setUp {
    [super setUp];
    self.viewModel = [[CalculateViewModel alloc] init];
    self.viewModel.recordManager = [[MockRecordManager alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAddOperation {
    self.viewModel.displayString = @"10.0";
    [self.viewModel performOperationType:kOperationTypeAdd];
    self.viewModel.displayString = @"20.0";
    [self.viewModel performOperationType:kOperationTypeEqual];
    XCTAssertTrue([self.viewModel.displayString isEqualToString:@"30"]);
}

- (void)testAddThreeTimes {
    self.viewModel.displayString = @"10.0";
    [self.viewModel performOperationType:kOperationTypeAdd];
    self.viewModel.displayString = @"20.0";
    [self.viewModel performOperationType:kOperationTypeAdd];
    XCTAssertTrue([self.viewModel.displayString isEqualToString:@"30"]);
    self.viewModel.displayString = @"20.0";
    [self.viewModel performOperationType:kOperationTypeAdd];
    XCTAssertTrue([self.viewModel.displayString isEqualToString:@"50"]);
    self.viewModel.displayString = @"20.0";
    [self.viewModel performOperationType:kOperationTypeAdd];
    XCTAssertTrue([self.viewModel.displayString isEqualToString:@"70"]);
}

- (void)testMinerOperation {
    self.viewModel.displayString = @"10.0";
    [self.viewModel performOperationType:kOperationTypeMinor];
    self.viewModel.displayString = @"20.0";
    [self.viewModel performOperationType:kOperationTypeEqual];
    XCTAssertTrue([self.viewModel.displayString isEqualToString:@"-10"]);
}

- (void)testMultipleOperation {
    self.viewModel.displayString = @"10.0";
    [self.viewModel performOperationType:kOperationTypeMultiple];
    self.viewModel.displayString = @"20.0";
    [self.viewModel performOperationType:kOperationTypeEqual];
    XCTAssertTrue([self.viewModel.displayString isEqualToString:@"200"]);
}

- (void)testDivideOperation {
    self.viewModel.displayString = @"10.0";
    [self.viewModel performOperationType:kOperationTypeDivide];
    self.viewModel.displayString = @"20.0";
    [self.viewModel performOperationType:kOperationTypeEqual];
    XCTAssertTrue([self.viewModel.displayString isEqualToString:@"0.5"]);
}

- (void)testSqrtOperation {
    self.viewModel.displayString = @"400.0";
    [self.viewModel performOperationType:kOperationTypeSqrt];
    XCTAssertTrue([self.viewModel.displayString isEqualToString:@"20"]);
}

- (void)testEqualOperationWithoutPending {
    self.viewModel.displayString = @"0";
    [self.viewModel performOperationType:kOperationTypeEqual];
    XCTAssertTrue([self.viewModel.displayString isEqualToString:@"0"]);
}

- (void)testClearOpeartion {
    self.viewModel.displayString = @"737.0";
    [self.viewModel performOperationType:kOperationTypeClear];
    XCTAssertTrue([self.viewModel.displayString isEqualToString:@"0"]);
}

- (void)testPiOperation {
    self.viewModel.displayString = @"342.0";
    [self.viewModel performOperationType:kOperationTypePi];
    XCTAssertTrue([self.viewModel.displayString isEqualToString:@"3.14159"]);
}

- (void)testSquareOperation {
    self.viewModel.displayString = @"4.0";
    [self.viewModel performOperationType:kOperationTypeSquare];
    XCTAssertTrue([self.viewModel.displayString isEqualToString:@"16"]);
}

- (void)testAppendNumberDigit {
    self.viewModel.displayString = @"45";
    [self.viewModel appendDigit:@"1"];
    XCTAssertTrue([self.viewModel.displayString isEqualToString:@"1"]);
    [self.viewModel appendDigit:@"2"];
    XCTAssertTrue([self.viewModel.displayString isEqualToString:@"12"]);
}

- (void)testAppendDotDigit {
    self.viewModel.displayString = @"0";
    [self.viewModel appendDigit:@"."];
    XCTAssertTrue([self.viewModel.displayString isEqualToString:@"0."]);
    self.viewModel.displayString = @"34.44";
    [self.viewModel appendDigit:@"."];
    XCTAssertTrue([self.viewModel.displayString isEqualToString:@"34.44"]);
}

- (void)testDisplayMaxLength {
    [self.viewModel appendDigit:@"7"];
    self.viewModel.displayString = @"123456789123456";
    [self.viewModel appendDigit:@"7"];
    XCTAssertTrue([self.viewModel.displayString isEqualToString:@"123456789123456"]);
}

- (void)testPeformPlusMinus {
    [self.viewModel appendDigit:@"7"];
    [self.viewModel performOperationType:kOperationTypePlusMinus];
    XCTAssertTrue([self.viewModel.displayString isEqualToString:@"-7"]);
    [self.viewModel performOperationType:kOperationTypePlusMinus];
    XCTAssertTrue([self.viewModel.displayString isEqualToString:@"7"]);
}

@end
