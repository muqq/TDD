//
//  RecordManager.h
//  calculate
//
//  Created by QQ Shih on 2017/4/19.
//  Copyright © 2017年 QQ Shih. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecordManager : NSObject

+ (id)sharedManager;

- (void)addRecord:(NSString *)record;

- (NSArray *)records;

@end
