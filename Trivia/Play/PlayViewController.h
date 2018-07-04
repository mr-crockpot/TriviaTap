//
//  PlayViewController.h
//  Trivia
//
//  Created by Adam Schor on 6/11/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"
#import "Validate.h"
#import "Buttons.h"
#import "Labels.h"



@interface PlayViewController : UIViewController

@property (strong,nonatomic) DBManager *dbManager;

@property (strong, nonatomic) NSMutableArray *arrData;
@property (strong, nonatomic) NSMutableArray *arrQuestion;
@property (strong, nonatomic) IBOutlet Buttons *btnAnswer1;

- (IBAction)btnAnswerPressed:(id)sender;

@property (strong, nonatomic) IBOutlet Buttons *btnAnswer2;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *outletCollectionBtnAnswers;

@property (strong, nonatomic) IBOutlet Labels *lblQuestion;
@property (strong, nonatomic) IBOutlet Labels *lblResult;

@property NSInteger level;


@property BOOL isCorrect;

@property NSTimer *gameTimer;
@property float startTime;
@property (strong, nonatomic) IBOutlet Labels *lblTimer;

@property NSInteger numberRight;
@property NSInteger numberWrong;
@property (strong, nonatomic) IBOutlet UILabel *lblRight;
@property (strong, nonatomic) IBOutlet UILabel *lblWrong;
@property (strong, nonatomic) IBOutlet UILabel *lblLevel;

@property float highEnd;
@property float lowEnd;


@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *outletCollectionLights;

@property (strong, nonatomic) UIBarButtonItem *barBtntimer;

@property BOOL levelFlash;
@property (strong, nonatomic) UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet Labels *lblPoints;
@property NSInteger points;

@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;


@end
