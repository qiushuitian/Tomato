//
//  WorkViewController.m
//  Tomato
//
//  Created by qiushuitian on 7/6/15.
//  Copyright (c) 2015 dengjian. All rights reserved.
//

#import "WorkViewController.h"
#import "CircleProgressView.h"
#import "DataCenter.h"

@interface WorkViewController ()
@property (weak, nonatomic) IBOutlet CircleProgressView *circleProgressView;
@property (weak, nonatomic) IBOutlet UIButton *beginButton;
@property (strong, nonatomic) NSTimer *timer;




@end

@implementation WorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.circleProgressView setTimeLimit:20 * 1];
    [self.circleProgressView setStatus:@"未开始"];
    [self.circleProgressView setTintColor:[UIColor blueColor]];
    [self.circleProgressView setElapsedTime:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startTimer {
    if ((!self.timer) || (![self.timer isValid])) {
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.00
                                                      target:self
                                                    selector:@selector(poolTimer)
                                                    userInfo:nil
                                                     repeats:YES];
    }
}

-(void)stopTimer{
    if (self.timer) {
        [self.timer invalidate];
    }

}

- (void)poolTimer
{
    if ([DataCenter instance].isWorking) {
        NSDate * beginTime = [DataCenter instance].workBeginTime;
        NSDate * now = [NSDate date];
        NSTimeInterval timeCost = [now timeIntervalSinceDate:beginTime];
        self.circleProgressView.elapsedTime = timeCost;
        if (timeCost >= 20) {
            [self finishWork];
        }
    }
    
}

- (IBAction)clickBeginButton:(id)sender {
    [DataCenter instance].isWorking = YES;
    [DataCenter instance].workBeginTime = [NSDate date];
    [self.beginButton setEnabled:NO];
    [self.circleProgressView setStatus:@"进行中"];
    [self startTimer];
}

-(void)finishWork{
    [self stopTimer];
    [DataCenter instance].isWorking = NO;
    [DataCenter instance].workBeginTime = [NSDate dateWithTimeIntervalSince1970:0];
    [self.beginButton setEnabled:YES];
    [self.circleProgressView setStatus:@"完成"];
    

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
