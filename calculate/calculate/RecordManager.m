//
//  RecordManager.m
//  calculate
//
//  Created by QQ Shih on 2017/4/19.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import "RecordManager.h"

@interface RecordManager ()

@property (nonatomic) NSMutableArray *_records;

@end

@implementation RecordManager

+ (id)sharedManager {
    static RecordManager *recordManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        recordManager = [[RecordManager alloc] init];
        recordManager._records = [[NSMutableArray alloc] init];
    });
    return recordManager;
}

- (void)addRecord:(NSString *)record {
    [self._records addObject:record];
}

- (NSArray *)records {
    return self._records;
}

@end
