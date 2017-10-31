//
//  FirstViewController.m
//  KSenTimer
//
//  Created by ehsy-pc on 2017/10/31.
//  Copyright © 2017年 ehsy-pc. All rights reserved.
//

#import "FirstViewController.h"
#import "KSTestTimer.h"
#import "KSTestSelf.h"
@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIButton *noRepeatBtn;
@property (weak, nonatomic) IBOutlet UIButton *repeatBtn;

@property (weak, nonatomic) IBOutlet UIButton *testBtn;
@property (weak, nonatomic) IBOutlet UIButton *delayBtn;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"NSTimer";
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view from its nib.
}

/**
 
 @param sender 点击不重复执行的timerbtn
 */
- (IBAction)cilckNoRepeatBtn:(UIButton *)sender {
    NSLog(@"Test retatin target for non-repeat timer!");
    KSTestTimer *testObject = [[KSTestTimer alloc] init];
    [NSTimer scheduledTimerWithTimeInterval:5 target:testObject selector:@selector(timerAction:) userInfo:nil repeats:NO];
    NSLog(@"Invoke release to testObject!");
}

/**
 
 @param sender 点击重复执行的timerbtn
 */
- (IBAction)clickRepeatBtn:(UIButton *)sender {
    NSLog(@"Test retain target for repeat Timer");
    KSTestTimer *testObject2 = [[KSTestTimer alloc] init];
    [NSTimer scheduledTimerWithTimeInterval:5 target:testObject2 selector:@selector(timerAction:) userInfo:nil repeats:YES];
    NSLog(@"Invoke release to testObject2!");
}


/**
 @param sender 测试 KSTestSelf类里 dealloc方法有没用执行
 */
- (IBAction)clickTestBtn:(UIButton *)sender {
    
    KSTestSelf *testObject = [[KSTestSelf alloc] init];
    
    [testObject.timer invalidate];
}


/**
 

 @param sender 测试定时器等待某个耗时任务执行以后 再次执行定时任务时时间间隔和周期规律
 */
- (IBAction)clickDelayBtn:(UIButton *)sender {
    [self testTimerDelayPlay];
}

-(void)testTimerDelayPlay
{
    KSTestTimer *testObject2 = [[KSTestTimer alloc] init];
    [NSTimer scheduledTimerWithTimeInterval:1 target:testObject2 selector:@selector(timerAction:) userInfo:nil repeats:YES];
    
    
    NSLog(@"Simulate busy");
    [self performSelector:@selector(simulateBusy) withObject:nil afterDelay:3];
}

// 模拟当前线程正好繁忙的情况
- (void)simulateBusy
{
    NSLog(@"start simulate busy!");
    NSUInteger caculateCount = 0x3FFFFFFF;
    CGFloat uselessValue = 0;
    for (NSUInteger i = 0; i < caculateCount; ++i) {
        uselessValue = i / 0.2222;
    }
    NSLog(@"finish simulate busy!");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
