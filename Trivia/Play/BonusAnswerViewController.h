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

@interface BonusAnswerViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(Buttons) NSArray *outletCollectionBtnAnswers;

- (IBAction)btnAnswerPressed:(UIButton*)sender;

@property NSInteger points;
@property NSInteger bet;
@property BOOL correctAnswer;

@property NSString *question;
@property (strong, nonatomic) IBOutlet Labels *lblQuestion;


@property (strong, nonatomic) NSMutableArray* arrAnswers;


@end
