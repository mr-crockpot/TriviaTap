//
//  Labels.m
//  Trivia
//
//  Created by Adam Schor on 6/24/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import "Labels.h"

@implementation Labels

-(void)formatQuestionLabels {
    self.font = [UIFont fontWithName:@"Courier" size:48];
    self.numberOfLines = 0;
    self.textColor = [UIColor redColor];
    self.layer.borderColor = [[UIColor blueColor] CGColor];
    self.layer.borderWidth = 2;
    self.textAlignment = NSTextAlignmentCenter;
    
    
}

@end
