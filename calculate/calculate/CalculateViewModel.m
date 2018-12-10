//
//  CalculateViewModel.m
//  calculate
//
//  Created by QQ Shih on 2017/4/19.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "CalculateViewModel.h"
#import "PendingBinaryOperationInfo.h"
#import "RecordManager.h"

@interface CalculateViewModel ()

@property (nonatomic) PendingBinaryOperationInfo *pendingInfo;
@property (nonatomic) double displayValue;
@property (nonatomic) BOOL isInMiddleOfType;

@end

@implementation CalculateViewModel

- (instancetype)init {
    if (self = [super init]) {
        self.recordManager = [RecordManager sharedManager];
        self.isInMiddleOfType = NO;
    }
    return self;
}

- (double)displayValue {
    return [self.displayString doubleValue];
}

- (void)setDisplayValue:(double)displayValue {
    self.displayString = [NSString stringWithFormat:@"%g", displayValue];
}

- (void)appendDigit:(NSString *)digit {
    if ([digit isEqualToString:@"."]) {
        if (![self.displayString containsString:@"."]) {
            self.displayString = [self.displayString stringByAppendingString:digit];
        }
    } else {
        if (self.isInMiddleOfType) {
            if (self.displayString.length < 15) {
                self.displayString = [self.displayString stringByAppendingString:digit];
            }
        } else {
            self.displayString = digit;
            self.isInMiddleOfType = YES;
        }
    }
}

- (void)performOperationType:(OperationType)type {
    __weak typeof(self) weakSelf = self;
    switch (type) {
        case kOperationTypeSqrt:
            self.displayValue = sqrt(self.displayValue);
            break;
        case kOperationTypeAdd: {
            [weakSelf executeBinaryOperationWithBinaryFunction:^double(double value1, double value2) {
                double result = value1 + value2;
                [weakSelf addRecordWithOperationString:@"+" value1:value1 value2:value2 result:result];
                return result;
            }];
            break;
        }
        case kOperationTypeMinor: {
            [weakSelf executeBinaryOperationWithBinaryFunction:^double(double value1, double value2) {
                double result = value1 - value2;
                [weakSelf addRecordWithOperationString:@"-" value1:value1 value2:value2 result:result];
                return result;
            }];
            break;
        }
        case kOperationTypeMultiple: {
            [self executeBinaryOperationWithBinaryFunction:^double(double value1, double value2) {
                double result = value1 * value2;
                [weakSelf addRecordWithOperationString:@"*" value1:value1 value2:value2 result:result];
                return result;
            }];
            break;
        }
        case kOperationTypeDivide: {
            [self executeBinaryOperationWithBinaryFunction:^double(double value1, double value2) {
                double result = value1 / value2;
                [weakSelf addRecordWithOperationString:@"+/" value1:value1 value2:value2 result:result];
                return result;
            }];
            break;
        }
        case kOperationTypeEqual:
            [self executePendingValue];
            break;
        case kOperationTypeClear:
            self.displayValue = 0;
            self.pendingInfo = nil;
            self.isInMiddleOfType = NO;
            break;
        case kOperationTypePi:
            self.displayValue = M_PI;
            break;
        case kOperationTypeSquare:
            self.displayValue = self.displayValue * self.displayValue;
            break;
        case kOperationTypePlusMinus:
            self.displayValue = self.displayValue * -1;
    }
}

- (void)addRecordWithOperationString:(NSString *)operationString value1:(double)value1 value2:(double)value2 result:(double)result {
    [self.recordManager addRecord: [NSString stringWithFormat:@"%g %@ %g = %g", value1, operationString, value2, result]];
}

- (void)executeBinaryOperationWithBinaryFunction:(BinaryFunction)binaryFunction {
    [self executePendingValue];
    self.pendingInfo = [[PendingBinaryOperationInfo alloc] initWithPendingValue:self.displayValue binaryFunction:binaryFunction];
    self.isInMiddleOfType = NO;
}

- (void)executePendingValue {
    if (self.pendingInfo) {
        self.displayValue = self.pendingInfo.blockFunction(self.pendingInfo.pendingValue, self.displayValue);
        self.pendingInfo = nil;
    }
}

@end
