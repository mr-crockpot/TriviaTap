//
//  slideRightSegue.m
//  Trivia
//
//  Created by Adam Schor on 6/29/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import "slideRightSegue.h"

@implementation slideRightSegue

-(void)perform {
    
    
    UIViewController *sourceViewController = self.sourceViewController;
    UIViewController *destinationViewController = self.destinationViewController;
    CGFloat width = sourceViewController.view.frame.size.width;
    CGFloat height = sourceViewController.view.frame.size.height;
    
    
    [destinationViewController.view setFrame:CGRectMake(-width, 0,width, height)];
    
    [sourceViewController.view addSubview:destinationViewController.view];
    [UIView animateWithDuration:0.35
                     animations:^{
                         
                         [destinationViewController.view setFrame:CGRectMake(0, 0, width,height)];
                         
                     } completion:^(BOOL finished) {
                         [sourceViewController presentViewController:destinationViewController animated:NO completion:NULL];
                     }];
    
    
}

@end
