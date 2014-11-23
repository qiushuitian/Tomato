//
//  PushNoAnimationSegue.m
//  Tomato
//
//  Created by qiushuitian on 22/11/14.
//  Copyright (c) 2014 dengjian. All rights reserved.
//

#import "PushNoAnimationSegue.h"

@implementation PushNoAnimationSegue

-(void) perform{
    UIViewController * sourceVC = self.sourceViewController;
    UIViewController * destVC = self.destinationViewController;
    [sourceVC presentViewController:destVC  animated:NO completion:nil];
//    [sourceVC addChildViewController:destVC];
//    [sourceVC transitionFromViewController:sourceVC
//                          toViewController:destVC
//                                  duration:0
//                                   options:UIViewAnimationOptionTransitionFlipFromLeft
//                                animations:nil
//                                completion:nil];
    
}
@end
