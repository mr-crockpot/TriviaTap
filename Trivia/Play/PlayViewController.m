//
//  PlayViewController.m
//  Trivia
//
//  Created by Adam Schor on 6/11/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import "PlayViewController.h"
#import "SpeedViewController.h"
#import "BonusViewController.h"

@interface PlayViewController ()

@end

@implementation PlayViewController
-(BOOL)prefersStatusBarHidden {
    return YES;
}
- (void)viewDidLoad {
    
    self.view.backgroundColor = [UIColor whiteColor];
   
    _dbManager = [[DBManager alloc] initWithDatabaseFilename:@"trivia.db"];
    if (!_points) {
        _points = 0;
    }
    _lblPoints.text = [NSString stringWithFormat:@"%li",_points];
    _startTime = 60;
    _gameTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerCountDown) userInfo:nil repeats:YES];
    _highEnd = .8;
    _lowEnd = .2f;
    
    //TITLE LABEL
   
    [self setTitleLabelwithLevel:_level];
    
    //FORMAT TIMER BAR BUTTON
    
    [_lblTimer formatTimerLabels];
    

    //FORMAT QUESTION LABEL
    
    [_lblQuestion formatQuestionLabels];
    
    //FORMAT LIGHTS
    
    for (UILabel *lights in _outletCollectionLights) {
        float width = self.view.frame.size.width/15;
        if (lights.tag<5) {
            lights.frame = CGRectMake(width*lights.tag, 50, width, width);
        }
        
        if (lights.tag>4) {
            lights.frame = CGRectMake(width*15/3 + width*lights.tag, 50, width, width);
        }
        lights.text = @"";
        lights.backgroundColor = [UIColor grayColor];
        lights.layer.cornerRadius = width/2;
        lights.layer.masksToBounds = YES;
        
    }
    
    //FORMAT ANSWER BUTTONS
    
    for (UIButton *btnAnswers in _outletCollectionBtnAnswers) {
        [btnAnswers setBackgroundColor:[UIColor whiteColor]];
        btnAnswers.layer.borderColor = [[UIColor blackColor] CGColor];
        btnAnswers.layer.borderWidth = 3;
        btnAnswers.titleLabel.numberOfLines = 0;
        if (btnAnswers.tag == 0) {
            btnAnswers.backgroundColor = [UIColor yellowColor];
            
        }
        else {
            btnAnswers.backgroundColor = [UIColor cyanColor];
        }
        
        
        
        
    }
    
    //FORMAT POINTS LABEL
    
    [_lblPoints formatPointsLabels];
    
    //FORMAT RESULT LABEL
    
    [_lblResult formatResultLabels];
    
    [self loadData];
    
   
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setTitleLabelwithLevel: (NSInteger) level {
   
        _navBar.topItem.title = [NSString stringWithFormat:@"Level %li",_level + 1];
    _navBar.backgroundColor = [UIColor greenColor];
    
     NSDictionary *navbarTitleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
     [UIColor whiteColor],NSForegroundColorAttributeName,
     nil];
     
     [_navBar setTitleTextAttributes:navbarTitleTextAttributes];
     
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
    
    
    NSString *question1 = _arrData[0][1];
    NSString *question2 = _arrData[1][1];
    
    [_btnAnswer1 formatButtonWithString:question1];
    [_btnAnswer2 formatButtonWithString:question2];
    
        
 
    
  
}

- (IBAction)btnAnswerPressed:(UIButton *)sender {
    NSInteger resultNumber;
    NSInteger otherTag;
    if (sender.tag == 0) {
        otherTag = 1;
    }
    else {
        otherTag = 0;
    }
  
    if ([_arrData[sender.tag][2] integerValue]> [_arrData[otherTag][2]integerValue]) {
        _isCorrect = YES;
       
        ((UILabel *)_outletCollectionLights[_numberRight]).backgroundColor = [UIColor greenColor];
        _numberRight = _numberRight + 1;
        
        resultNumber = 1;
        
        
    }
    else {
        _isCorrect = NO;
      
        ((UILabel *)_outletCollectionLights[_numberWrong + 5]).backgroundColor = [UIColor redColor];
        _numberWrong = _numberWrong + 1;
       
        resultNumber = 0;
    }
    if (_startTime>0) {
        [self loadData];
    }
    [self displayResultwithResultNumber:resultNumber];
    [self assessProgress];
}

-(void)displayResultwithResultNumber:(NSInteger)resultNumber{
  
    NSString *result;
    UIColor *alertColor;
    switch (resultNumber) {
        case 0:
            result = @"Wrong";
            alertColor = [UIColor redColor];
            break;
        case 1:
            result = @"Right";
            alertColor = [UIColor greenColor];
            _points = _points + 10*(_level+1);
            _lblPoints.text = [NSString stringWithFormat:@"%li",_points];
            
            break;
        default:
            break;
    }
    _lblResult.text = result;
    _lblResult.backgroundColor = alertColor;
    
  [UIView animateWithDuration:1
                   animations:^{
                       self.lblResult.alpha = 0;
                   } completion:^(BOOL finished) {
                      self.lblResult.alpha = 1;
                       self.lblResult.text = @"";
                       self.lblResult.backgroundColor = [UIColor clearColor];
                   }];
    
}

-(void)assessProgress {
    if (_numberWrong == 5) {
        self.view.backgroundColor = [UIColor redColor];
        [_gameTimer invalidate];
        
    }
    if (_numberRight == 1) {
        
  
      [self goToSpeedRound];
 //       [self performSegueWithIdentifier:@"seguePlayToBonus" sender:self];
        
        //[self setTitleLabelwithLevel:_level];
        _numberWrong = 0;
        _numberRight = 0;
        _startTime = 60;
        
        if (_lowEnd>0.1) {
            _lowEnd = _lowEnd - 0.1;}
        else {
            _lowEnd = 0.005;
        }
        if (_highEnd >0.2) {
            _highEnd = _highEnd - 0.1;
            }
        else {
            _highEnd = .1;
            }
        }
    
    
    [self loadData];
    
        
    
}

-(void)goToSpeedRound{
    
        [self performSegueWithIdentifier:@"seguePlayToSpeed" sender:self];
  
}

-(void)timerCountDown {
   
    _startTime = _startTime - .1;
    
    if (_startTime<10) {
         self.navigationController.navigationBar.backgroundColor = [UIColor yellowColor];
        _lblTimer.textColor = [UIColor redColor];
        
        _levelFlash = !_levelFlash;
        if (_levelFlash) {
            _titleLabel.textColor = [UIColor clearColor];
            _navBar.backgroundColor = [UIColor clearColor];
        }
        else {
            _titleLabel.textColor = [UIColor redColor];
            _navBar.backgroundColor = [UIColor redColor];
        }
    }
    
    if (_startTime<0.001) {
        [_gameTimer invalidate];
        _lblTimer.text = @"Over";
        _lblTimer.textColor = [UIColor blueColor];
        _titleLabel.textColor = [UIColor blueColor];
       self.navigationController.navigationBar.backgroundColor = [UIColor redColor];
       
        
    }
    else {
    _lblTimer.text = [NSString stringWithFormat:@"%.01f",_startTime];
  
      
    }
  
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"seguePlayToSpeed"]) {
   
        SpeedViewController *speedViewController =[segue destinationViewController];
        speedViewController.incomingLevel = _level;
        speedViewController.points = _points;
    }
    if ([segue.identifier isEqualToString:@"seguePlayToBonus"]) {
        BonusViewController *bonusViewController = [segue destinationViewController];
        bonusViewController.points = _points;
    }
    
    
    }
@end
