//
//  Task.h
//  Tomato
//
//  Created by qiushuitian on 6/6/15.
//  Copyright (c) 2015 dengjian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Task;

@interface Task : NSManagedObject

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSDate * createTime;
@property (nonatomic, retain) NSNumber * status;
@property (nonatomic, retain) NSSet *subTasks;
@end

@interface Task (CoreDataGeneratedAccessors)

- (void)addSubTasksObject:(Task *)value;
- (void)removeSubTasksObject:(Task *)value;
- (void)addSubTasks:(NSSet *)values;
- (void)removeSubTasks:(NSSet *)values;

@end
