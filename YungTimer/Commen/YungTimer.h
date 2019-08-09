//
//  YungTimer.h
//  YungTimer
//
//  Created by zhangyaoyuan on 2019/8/9.
//  Copyright © 2019 Yung. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^YungTimerVoidBlock)(void);

@interface YungTimer : NSObject

- (void)createTimerWithTimeInterval:(NSTimeInterval)interval block:(YungTimerVoidBlock)block;

- (void)deallocTimer;

@end

NS_ASSUME_NONNULL_END
