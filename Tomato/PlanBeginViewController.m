//
//  PlanBeginViewController.m
//  Tomato
//
//  Created by qiushuitian on 22/11/14.
//  Copyright (c) 2014 dengjian. All rights reserved.
//

#import "PlanBeginViewController.h"

@interface PlanBeginViewController ()

@end

@implementation PlanBeginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"view = %@",self.view);
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
