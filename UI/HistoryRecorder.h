//
//  HistoryRecorder.h
//  UI
//
//  Created by 钟婕 on 2021/4/17.
//  Copyright © 2021年 钟婕. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HistoryRecorder : NSObject

@property (nonatomic, strong, readonly) NSArray *records;

+ (instancetype)shareInstance;//单例模式

- (void)addRecord:(NSString *)record;

@end

NS_ASSUME_NONNULL_END
