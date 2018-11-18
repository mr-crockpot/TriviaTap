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
 
    _lblTimer.text = [NSString stringWithFormat:@"%li",_time];
    
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
    [self sendRightWrongMessage:_correctAnswer];
   

}

-(void)sendRightWrongMessage:(BOOL)correctAnswer {
    if (correctAnswer == 0){
        NSLog(@"Execute wrong graphic");
    }
    else {
        NSLog(@"Execute right graphic");
    }
    
    UILabel *result = [[UILabel alloc] initWithFrame:CGRectMake(300, 100, 300, 100)];
    result.text = @"Result";
    result.backgroundColor = [UIColor greenColor];
    result.layer.borderColor = [[UIColor redColor] CGColor];
    result.alpha = 1;
    [self.view addSubview:result];
    
  /*
    [UIView animateWithDuration:1 animations:^{
        result.alpha = 1;
    } completion:^(BOOL finished) {
        result.alpha = 0;
        // [self performSelector:@selector(doSegue) withObject:nil afterDelay:2];
    }];
   
   */
    [self performSelector:@selector(doSegue) withObject:nil afterDelay:2];
}

-(void)doSegue{
    [self performSegueWithIdentifier:@"segueBonusAnswerToPlay" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    PlayViewController *playViewController = [segue destinationViewController];
    playViewController.points = _points;
    
}
@end
