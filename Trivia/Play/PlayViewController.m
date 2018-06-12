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
    while (![self validateEntriesWithLowEnd:[self setLowEnd] highEnd:[self setHighEnd]]);
    
    _lblQuestion.text = _arrQuestion[0][1];
    [_btnAnswer1 setTitle:_arrData[0][1] forState:UIControlStateNormal];
    [_btnAnswer2 setTitle:_arrData[1][1] forState:UIControlStateNormal];
    
    
}

-(BOOL)validateEntriesWithLowEnd: (float) lowEnd highEnd:(float)highEnd{
    float answer1 = [_arrData[0][2] floatValue ];
    float answer2 = [_arrData[1][2] floatValue ];
    float absValDiff = ABS(answer1/answer2 -1);
    
    if (absValDiff<highEnd && absValDiff>lowEnd) {
        return TRUE;
        //TRUE means proceed.
        
    }
    else{
        return FALSE;
        //FALSE means keep finding questions
    }
    
    
}

-(float)setHighEnd{
    return 5;
}

-(float)setLowEnd {
    return 1;
    
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
        _lblQuestion.text = @"Correct";
    }
    else {
        _isCorrect = NO;
        _lblQuestion.text = @"Wrong";
    }
    
}
@end
