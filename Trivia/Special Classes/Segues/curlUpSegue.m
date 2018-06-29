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
    [UIView transitionWithView:sourceViewController.navigationController.view duration:1.0
                       options:(UIViewAnimationOptionTransitionCurlUp| UIViewAnimationOptionCurveEaseIn)
                    animations:^{
                        [sourceViewController.navigationController presentedViewController];
                    }
                    completion:NULL];
}
@end
