//
//  KSTestSelf.m
//  KSenTimer
//
//  Created by ehsy-pc on 2017/10/31.
//  Copyright © 2017年 ehsy-pc. All rights reserved.
//

#import "KSTestSelf.h"

@implementation KSTestSelf
- (id)init
{
    self = [super init];
    if (self) {
        NSLog(@"Test retatin target for non-repeat timer!");
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(testTimer:) userInfo:nil repeats:YES];
    }
    
    return self;
}

- (void)dealloc
{
    NSLog(@"测试是不是执行了这个方法!");
    // 自欺欺人的写法，永远都不会执行到，除非你在外部手动invalidate这个timer
    [_timer invalidate];
    
}

- (void)testTimer:(NSTimer*)timer
{
    NSLog(@"hahahaha!");
}
@end
