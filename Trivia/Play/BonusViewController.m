//
//  BonusViewController.m
//  Trivia
//
//  Created by Adam Schor on 6/29/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import "BonusViewController.h"

@interface BonusViewController ()

@end

@implementation BonusViewController

- (void)viewDidLoad {
    
    _dbManager = [[DBManager alloc] initWithDatabaseFilename:@"trivia.db"];
    
    [self loadQuestions];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self arrayForPicker];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadQuestions {
    NSString *queryQuestion = @"SELECT * FROM questions ORDER BY RANDOM() LIMIT 4";
    _arrQuestions = [[NSMutableArray alloc] initWithArray:[_dbManager loadDataFromDB:queryQuestion]];
    NSLog(@"The question array is %@",_arrQuestions);
    
    for (Buttons * buttons in _outletCollectionMyButtons) {
        [(Buttons*)buttons formatButtonWithString:_arrQuestions[buttons.tag][0]];
    }
    
}

- (IBAction)btnQuestionsPressed:(Buttons*)sender {
    
    NSString *topic = _arrQuestions[sender.tag][1];
    [self loadAnswersFromQuestion:topic];
    
    
}

-(void)loadAnswersFromQuestion: (NSString * )question{
    
    NSString *queryAnswer = [NSString stringWithFormat:@"SELECT * FROM data WHERE Category = '%@' ORDER BY RANDOM() LIMIT 2",question];
    _arrAnswers = [[NSMutableArray alloc] initWithArray:[_dbManager loadDataFromDB:queryAnswer]];
    [self performSegueWithIdentifier:@"segueBonusToBonusAnswer" sender:self];
}



#pragma mark SET UP PICKER

-(void)arrayForPicker {
    
    _points = 100;
    
    
   // _arrPickerValues = [[NSMutableArray alloc] initWithObjects:@"Place Your Bet",nil];
    _arrPickerValues = [[NSMutableArray alloc] init];
   
    for (int x=0; x<=_points; x+=10) {
        [_arrPickerValues addObject:@(x)];
        
    }
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _arrPickerValues.count;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
   // return _arrPickerValues[row];
    NSString *title = [_arrPickerValues[row] stringValue];
    return title;
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    _bet = [_arrPickerValues[row] integerValue];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueBonusToBonusAnswer"]) {
        BonusAnswerViewController *bonusAnswerViewController = [segue destinationViewController];
        bonusAnswerViewController.arrAnswers = _arrAnswers;
        bonusAnswerViewController.bet = _bet;
        bonusAnswerViewController.points = _points;
        
    }
}



@end
