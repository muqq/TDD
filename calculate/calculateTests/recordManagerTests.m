//
//  recordManagerTests.m
//  calculate
//
//  Created by QQ Shih on 2017/4/19.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RecordManager.h"

@interface recordManagerTests : XCTestCase

@end

@implementation recordManagerTests

- (void)testAddRecord {
    [[RecordManager sharedManager] addRecord:@"test 123"];
    [[RecordManager sharedManager] addRecord:@"test abc"];
    XCTAssertEqual([[RecordManager sharedManager] records].count, 2);
    XCTAssertEqual([[RecordManager sharedManager] records][0], @"test 123");
    XCTAssertEqual([[RecordManager sharedManager] records][1], @"test abc");
}

@end
