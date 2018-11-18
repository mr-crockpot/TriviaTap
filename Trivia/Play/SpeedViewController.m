//
//  SpeedViewController.m
//  Trivia
//
//  Created by Adam Schor on 6/23/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import "SpeedViewController.h"
#import "PlayViewController.h"


@interface SpeedViewController ()

@end

@implementation SpeedViewController

-(BOOL)prefersStatusBarHidden {
    return YES;
}
- (void)viewDidLoad {
  
    _dbManager = [[DBManager alloc] initWithDatabaseFilename:@"trivia.db"];
    _lblResult.alpha = 0;
    _lblQuestion.text = @"Bonus Round: 50 points each";
    [_lblQuestion formatQuestionLabels];
    
    
    
    for (Buttons *btnQuestion in _outletCollectionbtnAnswers) {
        [btnQuestion setTitle:@"" forState:UIControlStateNormal];
        }
    
    for (Labels *labelRanks in _outletCollectionLabelRank) {
        labelRanks.text = @ " ";
    }

    _speedRoundNumber = 1;
    
    [self performSelector:@selector(setUpRound) withObject:nil afterDelay:3];
  //  [self setUpRound];
}

-(void)setUpRound {
   
    _labelNumber = 0;
    _btnSubmit.enabled = NO;
    [self loadData];
    
    [_lblQuestion formatQuestionLabels];
    [_lblTimer formatTimerLabels];
    [_lblPoints formatPointsLabels];
    //FORMAT RANK LABELS
    
    for (Labels* rankLabels in _outletCollectionLabelRank){
        [(Labels *) rankLabels formatRankLabels];
       
    }
    //FORMAT BUTTONS
    
    _lblTimer.text = [NSString stringWithFormat:@"%li",_time];
    _lblPoints.text = [NSString stringWithFormat:@"%li",_points];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)btnAnswerPressed:(UIButton*)sender {
    _btnSubmit.enabled = NO;
    
    if (_labelNumber<4) {
        _labelNumber = _labelNumber + 1;
        }
    else {
        _labelNumber = 1;
        
    }
    
    for (UILabel *labelRanks in _outletCollectionLabelRank) {
        if (labelRanks.tag == sender.tag) {
            labelRanks.text = [NSString stringWithFormat:@"%li",_labelNumber];
            [_arrCheckAnswers replaceObjectAtIndex:_labelNumber-1 withObject:_arrAnswers[sender.tag][2]];
         
        }
        _labelTotal = _labelTotal + [labelRanks.text integerValue];
        
       
        
    }
     
    if (_labelTotal == 10) {
        _btnSubmit.enabled = YES;
    }
    else {
        _btnSubmit.enabled = NO;
    }
    
    _labelTotal = 0;
}
- (IBAction)btnSubmitPressed:(id)sender {
    
    _speedRoundNumber = _speedRoundNumber + 1;
    
    NSString *result;

    NSInteger answer1 = [_arrCheckAnswers[0] integerValue];
    NSInteger answer2 = [_arrCheckAnswers [1] integerValue];
    NSInteger answer3 = [_arrCheckAnswers [2] integerValue];
    NSInteger answer4 = [_arrCheckAnswers [3] integerValue];
    
    if (answer1>answer2 && answer2>answer3 && answer3>answer4) {
        result =@"Correct + 50 points";
        _lblResult.text = result;
        [_lblResult formatResultLabels];
        _lblResult.backgroundColor = [UIColor greenColor];
        _points = _points + 50;
       
    }
    else {
        result =@"Wrong. You lose 50 points";
        _lblResult.text = result;
        [_lblResult formatResultLabels];
        _lblResult.backgroundColor = [UIColor redColor];
        _points = _points - 50;
       
    }
    
    [UIView animateWithDuration:1 animations:^{
        self.lblResult.alpha = 1;
        
    } completion:^(BOOL finished) {
        self.lblResult.alpha = 0;
        if (self.speedRoundNumber<4) {
            for (Labels *labelRanks in self.outletCollectionLabelRank) {
                labelRanks.text = @ " ";
            }
            [self loadData];
            }
        else {
        [self performSegueWithIdentifier:@"segueSpeedToPlay" sender:self];
        }
    }];

}

-(void)loadData{

    _arrCheckAnswers = [[NSMutableArray alloc] init];
    
    NSString *queryQuestion = @"SELECT * from questions ORDER BY RANDOM () LIMIT 1";
    _arrQuestion = [[NSMutableArray alloc] initWithArray:[_dbManager loadDataFromDB:queryQuestion]];
    
    _lblQuestion.text = _arrQuestion[0][2];
    
    NSString *queryData = [NSString stringWithFormat:@"SELECT * FROM data WHERE Category = '%@' ORDER BY RANDOM() LIMIT 4",_arrQuestion[0][0]];
    _arrAnswers = [[NSMutableArray alloc] initWithArray:[_dbManager loadDataFromDB:queryData]];
    
    for (Buttons *btnAnswer in _outletCollectionbtnAnswers) {
      
        [btnAnswer formatButtonWithString:_arrAnswers[btnAnswer.tag][1]];
        
    }
    
   
    
    
    for (int z=0; z<4; z++) {
        [_arrCheckAnswers addObject:_arrAnswers[z][2]];
    }
    
    /*
     NSMutableArray *testMaxArray =[[NSMutableArray alloc] init];
     for (int z = 0; z<2; z++) {
     [testMaxArray addObject:_arrData[z][2]];
     }
     
     NSInteger max = [[testMaxArray valueForKeyPath:@"@max.self"] integerValue];
     NSLog(@"The max  is %li",max);
     NSInteger min = [[testMaxArray valueForKeyPath:@"@min.self"] integerValue];
     NSLog(@"The min  is %li",min);
     */
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    /*
     SpeedViewController *speedViewController = [(UINavigationController *)segue.destinationViewController topViewController];
     */
    PlayViewController *playViewController = [segue destinationViewController];
    playViewController.level = _incomingLevel + 1;
    playViewController.points = _points;
    
    
}
@end
