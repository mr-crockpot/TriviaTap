//
//  curlUpSegue.m
//  Trivia
//
//  Created by Adam Schor on 6/28/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import "curlUpSegue.h"

@implementation curlUpSegue
-(void)perform {
    UIViewController *sourceViewController = self.sourceViewController;
    UIViewController *destinationViewController = self.destinationViewController;
    
    
    [sourceViewController.view addSubview:destinationViewController.view];
    
    [UIView transitionWithView:sourceViewController.view duration:0.5 options:(UIViewAnimationOptionTransitionCurlUp|UIViewAnimationOptionCurveLinear) animations:^{
        [sourceViewController presentedViewController];
    } completion:^(BOOL finished) {
        
        [destinationViewController.view removeFromSuperview];
        [sourceViewController presentViewController:destinationViewController animated:NO completion:NULL];
    }];
}
@end
