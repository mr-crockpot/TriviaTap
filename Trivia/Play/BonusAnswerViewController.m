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
    NSString *message;
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;
    UIColor *background;
    if (correctAnswer == 0){
        message = @"Wrong. You lose XX Points";
        background = [UIColor redColor];
    }
    else {
       message = @"Right. You earn XX Points";
       background = [UIColor greenColor];
    }
    
     _announcementLabel = [[AnnouncementLabel alloc] initWithFrame:CGRectMake(0, height*.33, width, height*.33)];
   
    [_announcementLabel createAnnouncementLabel:message background:background];
                          
    
    _announcementLabel.alpha = 1;
    [self.view addSubview:_announcementLabel];
    
  
    [UIView animateWithDuration:3 animations:^{
        self.announcementLabel.alpha = 0;
    } completion:^(BOOL finished) {
        //self.announcementLabel.alpha = 1;
        
    }];
   

  [self performSelector:@selector(doSegue) withObject:nil afterDelay:3];
}

-(void)doSegue{
    [self performSegueWithIdentifier:@"segueBonusAnswerToPlay" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    PlayViewController *playViewController = [segue destinationViewController];
    playViewController.points = _points;
    
}
@end
