//
//  PlanViewController.m
//  Tomato
//
//  Created by qiushuitian on 4/6/15.
//  Copyright (c) 2015 dengjian. All rights reserved.
//

#import "PlanViewController.h"
#import "PlanTableViewController.h"

@interface PlanViewController ()

@end

@implementation PlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)clickShowPlanButton:(id)sender {
    PlanTableViewController * pvc = [[PlanTableViewController alloc] init];
    pvc.navigationItem.title = @"计划列表";
    [self.navigationController pushViewController:pvc animated:YES];
}


- (IBAction)clickPlanAddButton:(id)sender {
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
