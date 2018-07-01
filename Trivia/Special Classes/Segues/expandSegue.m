//
//  expandSegue.m
//  Trivia
//
//  Created by Adam Schor on 6/28/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import "expandSegue.h"

@implementation expandSegue

-(void)perform {

UIViewController *sourceViewController = self.sourceViewController;
UIViewController *destinationViewController = self.destinationViewController;

[sourceViewController.view addSubview:destinationViewController.view];
    
destinationViewController.view.transform = CGAffineTransformMakeScale(0.05, 0.05);
CGPoint originalCenter = destinationViewController.view.center;

[UIView animateWithDuration:1
                      delay:0.0
                    options:UIViewAnimationOptionCurveEaseInOut
                 animations:^{
                     destinationViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
                     destinationViewController.view.center = originalCenter;
                     
                 }
                 completion:^(BOOL finished){
                     [destinationViewController.view removeFromSuperview]; 
                     [sourceViewController presentViewController:destinationViewController animated:NO completion:NULL];
                      }];
}
@end
