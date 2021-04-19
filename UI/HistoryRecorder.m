//
//  HistoryRecorder.m
//  UI
//
//  Created by 钟婕 on 2021/4/17.
//  Copyright © 2021年 钟婕. All rights reserved.
//

#import "HistoryRecorder.h"

@interface HistoryRecorder ()

@property (nonatomic, strong) NSMutableArray *internalRecords;

@end

@implementation HistoryRecorder

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    static HistoryRecorder *recorder = nil;
    dispatch_once(&onceToken, ^{
        recorder = [HistoryRecorder new];
    });
    return recorder;
}

- (void)addRecord:(NSString *)record{
    if (!self.internalRecords) {
        self.internalRecords = [NSMutableArray array];
    }
    [self.internalRecords addObject:record];
}

- (NSArray *)records {
    return [self.internalRecords copy];
}

@end
