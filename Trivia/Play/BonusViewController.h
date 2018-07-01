//
//  BonusViewController.h
//  Trivia
//
//  Created by Adam Schor on 6/29/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"
#import "Buttons.h"
#import "BonusAnswerViewController.h"


@interface BonusViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) DBManager *dbManager;


@property (strong, nonatomic) IBOutlet UIPickerView *pickerBet;

@property (strong, nonatomic) NSMutableArray *arrPickerValues;

@property (strong, nonatomic) NSMutableArray *arrQuestions;
@property (strong, nonatomic) NSMutableArray *arrAnswers;

@property (strong, nonatomic) IBOutletCollection(Buttons) NSArray *outletCollectionMyButtons;
- (IBAction)btnQuestionsPressed:(id)sender;




@property NSInteger points;
@property NSInteger bet;
@end
