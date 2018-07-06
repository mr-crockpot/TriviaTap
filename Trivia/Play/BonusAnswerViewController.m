//
//  BonusAnswerViewController.m
//  Trivia
//
//  Created by Adam Schor on 6/30/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import "BonusAnswerViewController.h"
#import "PlayViewController.h"

@interface BonusAnswerViewController ()

@end

@implementation BonusAnswerViewController

-(BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 //   _arrAnswers = [[NSMutableArray alloc] init];
   
    [self loadData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadData {
    for (Buttons *answerButtons in _outletCollectionBtnAnswers)
        [(Buttons *) answerButtons formatButtonWithString:_arrAnswers[answerButtons.tag][1]];
    
    _lblQuestion.text = _question;
    [_lblQuestion formatQuestionLabels];
    
}

- (IBAction)btnAnswerPressed:(UIButton*)sender {
    NSInteger selectedTag = sender.tag;
    NSInteger otherTag;

    
    if (selectedTag == 0) {
        otherTag = 1;
    }
    else {
        otherTag = 0;
    }
    
    //Check Answer
    
    NSInteger selectedValue = [_arrAnswers[selectedTag][2] integerValue];
    NSInteger otherValue = [_arrAnswers[otherTag][2] integerValue];
    
    if (selectedValue>otherValue) {
       
        _correctAnswer = YES;
        _points = _points + _bet;
    }
    else {
       
        _correctAnswer = NO;
        _points = _points - _bet;
    }
    
    [self performSegueWithIdentifier:@"segueBonusAnswerToPlay" sender:self];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    PlayViewController *playViewController = [segue destinationViewController];
    playViewController.points = _points;
    
}
@end
