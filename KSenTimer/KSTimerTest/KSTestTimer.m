//
//  KSTestTimer.m
//  KSenTimer
//
//  Created by ehsy-pc on 2017/10/31.
//  Copyright © 2017年 ehsy-pc. All rights reserved.
//

#import "KSTestTimer.h"

@implementation KSTestTimer
-(id)init{
    self = [super init];
    if(self){
        NSLog(@"instance %@ has been created",self);
    }
    return self;
}
-(void)dealloc
{
    NSLog(@"instance %@ has been dealloced!",self);
//    [super dealloc];
}
-(void)timerAction:(NSTimer *)timer
{
    NSLog(@"Hi, Timer Action for instance %@", self);
}
@end
