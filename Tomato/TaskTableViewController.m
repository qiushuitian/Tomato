//
//  TaskTableViewController.m
//  Tomato
//
//  Created by qiushuitian on 4/6/15.
//  Copyright (c) 2015 dengjian. All rights reserved.
//

#import "TaskTableViewController.h"
#import "DataCenter.h"
#import "TaskTableViewCell.h"
#import "Task.h"
#import "UITableView+FDTemplateLayoutCell.h"


@interface TaskTableViewController ()

@property(nonatomic,strong) NSMutableArray * tasks;

@end

@implementation TaskTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    [self.tableView registerClass:[TaskTableViewCell class] forCellReuseIdentifier:@"taskTableViewCell"];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Task" inManagedObjectContext:[DataCenter instance].managedObjectContext];
    [request setEntity:entity];
    
    // Order the events by creation date, most recent first.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"createTime" ascending:NO];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [request setSortDescriptors:sortDescriptors];
    
    // Execute the fetch -- create a mutable copy of the result.
    NSError *error = nil;
    NSMutableArray *mutableFetchResults = [[[DataCenter instance].managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResults == nil) {
        NSLog(@"error");
        self.tasks = [NSMutableArray arrayWithCapacity:10];
    }else{
        self.tasks = mutableFetchResults;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];//每次载入都重新下载数据
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    NSInteger count = [self.tasks count];
    return count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    CGFloat h = 107;
    CGFloat h = [tableView fd_heightForCellWithIdentifier:@"taskTableViewCell" configuration:^(id cell) {
        [self loadCellData:cell indexPath:indexPath];
    }];
    return h;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellIdentifier = @"taskTableViewCell";

    TaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[TaskTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [self loadCellData:cell indexPath:indexPath];
    return cell;
}

-(void)loadCellData:(TaskTableViewCell *)cell indexPath:(NSIndexPath *)indexPath{
    Task * task = [self.tasks objectAtIndex:indexPath.row];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    cell.createTimeLabel.text = [dateFormatter stringFromDate:task.createTime];
    cell.contentLabel.text = task.content;

}


@end
