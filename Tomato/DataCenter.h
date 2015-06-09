//
//  DataCenter.h
//  Tomato
//
//  Created by qiushuitian on 7/6/15.
//  Copyright (c) 2015 dengjian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"


@interface DataCenter : NSObject

+(instancetype)instance;

-(NSManagedObjectContext *)managedObjectContext;
-(void)saveContext;

//work session
@property (strong, nonatomic) NSDate * workBeginTime;
@property (nonatomic) BOOL isWorking;


@end
