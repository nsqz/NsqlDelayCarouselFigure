//
//  NSTimer+Addition.h
//  nsqlDelayCarouseIFigure
//
//  Created by lanou on 16/5/7.
//  Copyright © 2016年 hl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Addition)

/**
 *  暂停
 */
- (void)pauseTimer;
/**
 *  继续
 */
- (void)resumeTimer;

/**
 *  多少秒后继续
 */
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
