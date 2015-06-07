//
//  PlanViewController.m
//  Tomato
//
//  Created by qiushuitian on 4/6/15.
//  Copyright (c) 2015 dengjian. All rights reserved.
//

#import "PlanViewController.h"
#import "TaskTableViewController.h"
#import "Task.h"
#import "DataCenter.h"

@interface PlanViewController ()
@property (weak, nonatomic) IBOutlet UITextField *taskTextField;
@property (weak, nonatomic) IBOutlet UITextField *costTimeTextField;

@end

@implementation PlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

-(void)tapView:(UITapGestureRecognizer*)tap{
    [self.taskTextField resignFirstResponder];
    [self.costTimeTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)clickPlanAddButton:(id)sender {
    
    NSString * taskDescription = self.taskTextField.text;
    NSString * time = self.costTimeTextField.text;
    
    Task * task = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:[[DataCenter instance] managedObjectContext]];
    task.createTime = [NSDate date];
    task.content = taskDescription;
    task.status = 0;
    task.planCostTime = [NSNumber numberWithFloat:[time floatValue] * 60];//内部单位 分钟
    
    NSError * error;
    if (![[DataCenter instance].managedObjectContext save:&error]) {
        NSLog(@"save error!");
    }else{
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"保存任务成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }
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
