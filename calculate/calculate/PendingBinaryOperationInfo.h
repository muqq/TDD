//
//  PendingBinaryOperationInfo.h
//  calculate
//
//  Created by QQ Shih on 2017/4/19.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CalculateViewModel;

@interface PendingBinaryOperationInfo : NSObject

typedef double (^BinaryFunction)(double value1, double value2);

@property (nonatomic, copy) BinaryFunction blockFunction;
@property (nonatomic) double pendingValue;

- (instancetype)initWithPendingValue:(double)pendingValue binaryFunction:(BinaryFunction)block;

@end
