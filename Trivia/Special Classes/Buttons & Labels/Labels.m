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
    self.adjustsFontSizeToFitWidth = YES;
    self.numberOfLines = 0;
    self.textColor = [UIColor redColor];
    self.layer.borderColor = [[UIColor blueColor] CGColor];
    self.layer.borderWidth = 2;
    self.textAlignment = NSTextAlignmentCenter;
    self.layer.cornerRadius = 15;
    
    
}

-(void)formatTimerLabels{
    self.font = [UIFont fontWithName:@"Helvetica" size:24];
    self.numberOfLines = 0;
    self.textColor = [UIColor blueColor];
    self.layer.borderColor = [[UIColor blueColor] CGColor];
    self.layer.borderWidth = 1;
    self.textAlignment = NSTextAlignmentCenter;
}

-(void)formatPointsLabels{
    self.font = [UIFont fontWithName:@"Helvetica" size:24];
    self.numberOfLines = 0;
    self.textColor = [UIColor greenColor];
    self.layer.borderColor = [[UIColor greenColor] CGColor];
    self.layer.borderWidth = 1;
    self.textAlignment = NSTextAlignmentCenter;
    self.backgroundColor = [UIColor grayColor];
}

-(void)formatResultLabels {
    
    self.textColor = [UIColor yellowColor];
    self.font = [UIFont fontWithName:@"Helvetica" size:40];
}

-(void)formatRankLabels {
    self.text = @" ";
    self.textColor = [UIColor blueColor];
    self.font = [UIFont fontWithName:@"Helvetica" size:36];
    self.layer.borderColor = [[UIColor blueColor] CGColor];
    self.layer.borderWidth = 2;
    self.textAlignment = NSTextAlignmentCenter;
    
    
}
@end
