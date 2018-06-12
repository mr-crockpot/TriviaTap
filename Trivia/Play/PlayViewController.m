//
//  PlayViewController.m
//  Trivia
//
//  Created by Adam Schor on 6/11/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import "PlayViewController.h"

@interface PlayViewController ()

@end

@implementation PlayViewController

- (void)viewDidLoad {
    _dbManager = [[DBManager alloc] initWithDatabaseFilename:@"trivia.db"];
    _level = 1;
    _startTime = 60;
    _gameTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerCountDown) userInfo:nil repeats:YES];
    _highEnd = 2.0f;
    _lowEnd = 1.0f;
    
    
    [self loadData];
    
   
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Load Data
-(void)loadData{
    NSString *queryQuestion = @"SELECT * FROM questions ORDER BY RANDOM() LIMIT 1";
    _arrQuestion = [[NSMutableArray alloc] initWithArray:[_dbManager loadDataFromDB:queryQuestion]];
    
    
    NSString *queryData = [NSString stringWithFormat:@"SELECT * FROM data WHERE Category = '%@' ORDER BY RANDOM() LIMIT 2",_arrQuestion[0][0]];
  
    //the bigger the criteria (both high and low end), the easier the question.
    do {
        _arrData = [[NSMutableArray alloc]initWithArray:[_dbManager loadDataFromDB:queryData]];
    }
  
    while (![Validate validateEntriesWithLowEnd:_lowEnd highEnd:_highEnd arrayOfData:_arrData]);
    
    
    _lblQuestion.text = _arrQuestion[0][1];
    [_btnAnswer1 setTitle:_arrData[0][1] forState:UIControlStateNormal];
    [_btnAnswer2 setTitle:_arrData[1][1] forState:UIControlStateNormal];
    
    
}

- (IBAction)btnAnswerPressed:(UIButton *)sender {
   
    NSInteger otherTag;
    if (sender.tag == 0) {
        otherTag = 1;
    }
    else {
        otherTag = 0;
    }
  
    if ([_arrData[sender.tag][2] integerValue]> [_arrData[otherTag][2]integerValue]) {
        _isCorrect = YES;
        _lblResult.text = @"Correct";
        _lblResult.backgroundColor =[UIColor greenColor];
        _numberRight = _numberRight + 1;
        _lblRight.text = [NSString stringWithFormat:@"%li",_numberRight];
        
        
    }
    else {
        _isCorrect = NO;
        _lblResult.text = @"Wrong";
        _lblResult.backgroundColor = [UIColor redColor];
        _numberWrong = _numberWrong + 1;
        _lblWrong.text = [NSString stringWithFormat:@"%li",_numberWrong];
    }
    if (_startTime>0) {
        [self loadData];
    }
    [self assessProgress];
}


-(void)assessProgress {
    if (_numberWrong == 5) {
        self.view.backgroundColor = [UIColor redColor];
        [_gameTimer invalidate];
        
    }
    if (_numberRight == 5) {
        _level = _level + 1;
        _lblLevel.text = [NSString stringWithFormat:@"Level %li",_level];
        _numberWrong = 0;
        _numberRight = 0;
        _startTime = 60;
        
        if (_lowEnd>0.25) {
            _lowEnd = _lowEnd - 0.25;}
        else {
            _lowEnd = 0.005;
        }
        if (_highEnd >0.5) {
            _highEnd = _highEnd - 0.5;
            }
        else {
            _highEnd = .1;
            }
        }
    
        [self loadData];
        
    
}

-(void)timerCountDown {
    
    _startTime = _startTime - .1;
    
    if (_startTime<0.001) {
        [_gameTimer invalidate];
        _lblTimer.text = @"Over";
    }
    else {
    _lblTimer.text = [NSString stringWithFormat:@"%f",_startTime];
    }
}
@end
