//
//  Buttons.m
//  Trivia
//
//  Created by Adam Schor on 6/24/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import "Buttons.h"

@implementation Buttons


-(void)formatButtonWithString: (NSString *)incomeString{
    
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderColor = [[UIColor blackColor] CGColor];
    self.layer.borderWidth = 3;
    self.layer.cornerRadius = 15;
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.layer.shadowOffset = CGSizeMake(2.0f, 2.0f);
    self.layer.shadowRadius = 2.0f;
    self.layer.shadowOpacity = 1;
    self.layer.masksToBounds = NO;
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    
    NSDictionary *attributes = @{ NSForegroundColorAttributeName : [UIColor blackColor],
                                  NSFontAttributeName : [UIFont fontWithName:@"Helvetica" size:36],
                                 };
    
    NSAttributedString *question1AttStr = [[NSAttributedString alloc] initWithString:incomeString attributes:attributes];
  
    [self setAttributedTitle:question1AttStr forState:UIControlStateNormal];
    
}

-(void)buttonPressAnimation {
    
    
    
    [self setBackgroundColor:[UIColor blueColor]];
    self.layer.shadowColor = [[UIColor yellowColor] CGColor];
    
    
    
}
@end
