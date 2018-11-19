//
//  BonusAnswerViewController.h
//  Trivia
//
//  Created by Adam Schor on 6/30/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Buttons.h"
#import "Labels.h"
#import "AnnouncementLabel.h"

@interface BonusAnswerViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(Buttons) NSArray *outletCollectionBtnAnswers;

- (IBAction)btnAnswerPressed:(UIButton*)sender;

@property NSInteger points;
@property NSInteger bet;
@property BOOL correctAnswer;

@property NSString *question;
@property (strong, nonatomic) IBOutlet Labels *lblQuestion;
@property (strong, nonatomic) IBOutlet Labels *lblTimer;

@property (strong, nonatomic) IBOutlet Labels *lblPoints;

@property (strong, nonatomic) NSMutableArray* arrAnswers;
@property NSInteger time;

@property AnnouncementLabel *announcementLabel;

@end
