//
//  fligSegue.m
//  Trivia
//
//  Created by Adam Schor on 6/28/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import "fligSegue.h"

@implementation fligSegue


-(void)perform {
    UIViewController *sourceViewController = self.sourceViewController;
    UIViewController *destinationViewController = self.destinationViewController;
    
  
    [sourceViewController.view addSubview:destinationViewController.view];
    [UIView transitionWithView:sourceViewController.navigationController.view duration:2.0
                       options:(UIViewAnimationOptionTransitionFlipFromRight| UIViewAnimationOptionCurveEaseIn)
                    animations:^{
                        [sourceViewController.navigationController presentedViewController];
                    }
                    completion:NULL];
    
}
    


@end
