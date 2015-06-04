//
//  StackContainerViewController.h
//  Tomato
//
//  Created by qiushuitian on 23/11/14.
//  Copyright (c) 2014 dengjian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StackContainerViewController : UIViewController

-(void)pushViewController:(UIViewController *)vc animated:(BOOL)animated completion:(void (^)(void))completion;
-(void)popViewController:(BOOL)animated completion:(void (^)(void))completion;

@end
