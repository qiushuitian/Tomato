//
//  PlanViewController.m
//  Tomato
//
//  Created by qiushuitian on 22/11/14.
//  Copyright (c) 2014 dengjian. All rights reserved.
//

#import "PlanViewController.h"

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

- (void)viewWillAppear:(BOOL)animated{
//    
    CGRect viewRect = self.view.frame;
//    CGRect tabbarRect = self.tabBarController.tabBar.frame;
//    CGRect newRect = CGRectMake(viewRect.origin.x,
//                                viewRect.origin.y,
//                                viewRect.size.width,
//                                viewRect.size.height - tabbarRect.size.height);
//    self.view.frame = newRect;
    
}

- (void)viewDidAppear:(BOOL)animated{
//    [self performSegueWithIdentifier:@"beginPlan" sender:self];
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
