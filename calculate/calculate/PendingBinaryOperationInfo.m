//
//  PendingBinaryOperationInfo.m
//  calculate
//
//  Created by QQ Shih on 2017/4/19.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "PendingBinaryOperationInfo.h"

@implementation PendingBinaryOperationInfo

- (instancetype)initWithPendingValue:(double)pendingValue binaryFunction:(BinaryFunction)block {
    if (self = [super init]) {
        self.blockFunction = block;
        self.pendingValue = pendingValue;
    }
    return self;
}

@end
