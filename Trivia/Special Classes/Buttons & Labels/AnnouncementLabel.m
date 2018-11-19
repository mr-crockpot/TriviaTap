//
//  AnnouncementLabel.m
//  Trivia
//
//  Created by Adam Schor on 11/18/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import "AnnouncementLabel.h"

@implementation AnnouncementLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)createAnnouncementLabel:(NSString *)announcement background: (UIColor * )backgroundColor{
    
    self.text = announcement;
    self.textAlignment = NSTextAlignmentCenter;
    self.font = [UIFont fontWithName:@"Helvetica" size:36];
    self.layer.borderColor = [[UIColor blueColor] CGColor];
    self.layer.borderWidth = 2;
    self.backgroundColor = backgroundColor;
    self.numberOfLines =0;
    self.alpha = 1;
    
    
    
}

@end
