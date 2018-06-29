//
//  segueSlideRight.m
//  Trivia
//
//  Created by Adam Schor on 6/29/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import "segueSlideRight.h"

@implementation segueSlideRight

-(void)perform {
    UIViewController *sourceViewController = self.sourceViewController;
    UIViewController *destinationViewController = self.destinationViewController;
    
    [sourceViewController.view addSubview:destinationViewController.view];
    
 //   destinationViewController.view.transform = CGAffineTransform (translationX:sourceViewController.)
    CGPoint originalCenter = destinationViewController.view.center;
    
    [UIView animateWithDuration:1
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         destinationViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
            //             destinationViewController.view.center = originalCenter;
                         
                     }
                     completion:^(BOOL finished){
                         [destinationViewController.view removeFromSuperview]; // remove from temp super view
                         [sourceViewController presentViewController:destinationViewController animated:NO completion:NULL];
                     }];
   
}
@end
