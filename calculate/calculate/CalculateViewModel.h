//
//  CalculateViewModel.h
//  calculate
//
//  Created by QQ Shih on 2017/4/19.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class RecordManager;

typedef enum OperationType {
    kOperationTypeAdd = 0,
    kOperationTypeMinor,
    kOperationTypeMultiple,
    kOperationTypeDivide,
    kOperationTypeSqrt,
    kOperationTypeEqual,
    kOperationTypeClear,
    kOperationTypePi,
    kOperationTypeSquare,
    kOperationTypePlusMinus
} OperationType;

@interface CalculateViewModel : NSObject

@property (nonatomic) NSString *displayString;

@property (nonatomic) RecordManager *recordManager;

- (void)performOperationType:(OperationType)type;

- (void)appendDigit:(NSString *)digit;

@end
