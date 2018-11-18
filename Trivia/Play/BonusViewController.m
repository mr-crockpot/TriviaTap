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

-(BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad {
    
    _dbManager = [[DBManager alloc] initWithDatabaseFilename:@"trivia.db"];
    _lblPoints.text = [NSString stringWithFormat:@"You have %li points",_points];
    [_lblPoints formatPointsLabels];
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
    
    for (Buttons * buttons in _outletCollectionMyButtons) {
        [(Buttons*)buttons formatButtonWithString:_arrQuestions[buttons.tag][0]];
    }
    
}

- (IBAction)btnQuestionsPressed:(Buttons*)sender {
    
    NSString *topic = _arrQuestions[sender.tag][0];
    _question = _arrQuestions[sender.tag][1];
    [self loadAnswersFromQuestion:topic];
    
    
}

-(void)loadAnswersFromQuestion: (NSString * )question{
   //question = _arrQuestions[0][0];
    NSString *queryAnswer = [NSString stringWithFormat:@"SELECT * FROM data WHERE Category = '%@' ORDER BY RANDOM() LIMIT 2",question];
    _arrAnswers = [[NSMutableArray alloc] initWithArray:[_dbManager loadDataFromDB:queryAnswer]];
   
    [self performSegueWithIdentifier:@"segueBonusToBonusAnswer" sender:self];
}



#pragma mark SET UP PICKER

-(void)arrayForPicker {
    
   // _points = 100;
    _arrPickerValues = [[NSMutableArray alloc] init];
   
    for (int x=0; x<=_points; x+=10) {
        [_arrPickerValues addObject:@(x)];
        
    }
    
    _arrDifficulty = [[NSMutableArray alloc] initWithObjects:
                      @"Easy",
                      @"Medium",
                      @"Hard",
                      nil];
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSInteger rows;
    switch (component) {
        case 0:
            rows = _arrPickerValues.count;
            break;
        case 1:
            rows = _arrDifficulty.count;
            break;
        default:
            rows = 0;
            break;
    }
    return rows;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *title;
    switch (component) {
        case 0:
            title = [_arrPickerValues[row] stringValue];
            break;
        case 1:
            title = _arrDifficulty [row];
            break;
        default:
            break;
    }
    
    return title;
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    switch (component) {
        case 0:
            _bet =[_arrPickerValues[row] integerValue];
            if (row<_arrPickerValues.count*.33) {
                [_pickerBet selectRow:0 inComponent:1 animated:YES];
                }
            if (row>=_arrPickerValues.count*.33 && row <_arrPickerValues.count*.65) {
                [_pickerBet selectRow:1 inComponent:1 animated:YES];
            }
            if (row>=_arrPickerValues.count*.65 && row <_arrPickerValues.count) {
                [_pickerBet selectRow:2 inComponent:1 animated:YES];
            }
            break;
        case 1:
            switch (row) {
                case 0:
                    [_pickerBet selectRow:_arrPickerValues.count*.3 inComponent:0 animated:YES];
                    break;
                case 1:
                    [_pickerBet selectRow:_arrPickerValues.count*.65 inComponent:0 animated:YES];
                    break;
                case 2:
                    [_pickerBet selectRow:_arrPickerValues.count-1 inComponent:0 animated:YES];
                    break;
                default:
                    break;
            }
            if  (row ==0){
                [_pickerBet selectRow:_arrPickerValues.count*.3 inComponent:0 animated:YES];
                }
            //do code for adjusting bet based on difficulty
            break;
            
            
        default:
            break;
    }
    NSInteger betRow = [_pickerBet selectedRowInComponent:0];
    
    _bet = [_arrPickerValues [betRow] integerValue] ;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueBonusToBonusAnswer"]) {
        BonusAnswerViewController *bonusAnswerViewController = [segue destinationViewController];
        bonusAnswerViewController.arrAnswers = _arrAnswers;
        bonusAnswerViewController.bet = _bet;
        bonusAnswerViewController.points = _points;
        bonusAnswerViewController.question = _question;
        bonusAnswerViewController.time = _time;
        
        
    }
}



@end
