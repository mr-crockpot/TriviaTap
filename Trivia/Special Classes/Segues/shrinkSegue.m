//
//  shrinkSegue.m
//  Trivia
//
//  Created by Adam Schor on 7/2/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import "shrinkSegue.h"

@implementation shrinkSegue

-(void)perform {
    
    UIViewController *sourceViewController = self.sourceViewController;
    UIViewController *destinationViewController = self.destinationViewController;
    
    [sourceViewController.view addSubview:destinationViewController.view];
    
    destinationViewController.view.transform = CGAffineTransformMakeScale(1,1);
    CGPoint originalCenter = destinationViewController.view.center;
    
    [UIView animateWithDuration:1
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         destinationViewController.view.transform = CGAffineTransformMakeScale(0.5, 0.5);
                         destinationViewController.view.center = originalCenter;
                         
                     }
                     completion:^(BOOL finished){
                         [destinationViewController.view removeFromSuperview];
                         [sourceViewController presentViewController:destinationViewController animated:NO completion:NULL];
                     }];
}
@end
