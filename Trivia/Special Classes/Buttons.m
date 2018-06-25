//
//  Buttons.m
//  Trivia
//
//  Created by Adam Schor on 6/24/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import "Buttons.h"

@implementation Buttons

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/*+(UIButton *)answerButton {
 
    UIButton *answerButton = [[UIButton alloc] init];
    [answerButton setTitle:@"Test Object" forState:UIControlStateNormal];
    answerButton.backgroundColor = [UIColor redColor];
    return answerButton;
    
    
}

- (Buttons*)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        NSLog(@"Init with Frame was called");
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    self.backgroundColor = [UIColor greenColor];
}

- (Buttons*)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        NSLog(@"Init was called");
    }
    return self;
}*/

-(void)formatButtonWithString: (NSString *)incomeString{
    
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderColor = [[UIColor blackColor] CGColor];
    self.layer.borderWidth = 3;
    self.layer.cornerRadius = 15;
    self.layer.shadowColor = [[UIColor yellowColor] CGColor];
    self.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    self.layer.shadowRadius = 2.0f;
    self.layer.shadowOpacity = 1;
    self.layer.masksToBounds = NO;
    
    NSDictionary *attributes = @{ NSForegroundColorAttributeName : [UIColor blackColor],
                                  NSFontAttributeName : [UIFont fontWithName:@"Helvetica" size:36],
                                 };
    
    NSAttributedString *question1AttStr = [[NSAttributedString alloc] initWithString:incomeString attributes:attributes];
  
    [self setAttributedTitle:question1AttStr forState:UIControlStateNormal];
    
}
@end
