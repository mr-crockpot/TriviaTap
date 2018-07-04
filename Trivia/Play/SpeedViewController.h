//
//  SpeedViewController.h
//  Trivia
//
//  Created by Adam Schor on 6/23/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"
#import "Buttons.h"
#import "Labels.h"

@interface SpeedViewController : UIViewController

@property (strong, nonatomic) DBManager *dbManager;

@property (strong, nonatomic) IBOutletCollection(Buttons) NSArray *outletCollectionbtnAnswers;

@property (strong, nonatomic) IBOutletCollection(Labels) NSArray *outletCollectionLabelRank;


- (IBAction)btnAnswerPressed:(id)sender;

@property NSInteger labelNumber;
@property NSInteger labelTotal;
@property (strong, nonatomic) IBOutlet UIButton *btnSubmit;
- (IBAction)btnSubmitPressed:(id)sender;

@property (strong, nonatomic) NSMutableArray *arrQuestion;
@property (strong, nonatomic) NSMutableArray *arrAnswers;
@property (strong, nonatomic) NSMutableArray *arrCheckAnswers;

@property (strong, nonatomic) IBOutlet Labels *lblQuestion;

@property NSInteger incomingLevel;

@property NSInteger points;
@property (strong, nonatomic) IBOutlet Labels *lblTimer;

@property (strong, nonatomic) IBOutlet Labels *lblPoints;
@property (strong, nonatomic) IBOutlet Labels *lblResult;

@property NSInteger speedRoundNumber;

@end
