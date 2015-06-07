//
//  DataCenter.m
//  Tomato
//
//  Created by qiushuitian on 7/6/15.
//  Copyright (c) 2015 dengjian. All rights reserved.
//

#import "DataCenter.h"

@implementation DataCenter

+(instancetype)instance{
    static DataCenter * g_datacenter_instance;
    if (g_datacenter_instance == nil) {
        g_datacenter_instance = [[DataCenter alloc] init];
    }
    return g_datacenter_instance;
}

-(NSManagedObjectContext *)managedObjectContext{
    AppDelegate * delegate = [UIApplication sharedApplication].delegate;
    return delegate.managedObjectContext;
}


@end
