//
//  BonusAnswerViewController.m
//  Trivia
//
//  Created by Adam Schor on 6/30/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import "BonusAnswerViewController.h"

@interface BonusAnswerViewController ()

@end

@implementation BonusAnswerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Array Answers incoming is %@",_arrAnswers);
    [self loadAnswers];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadAnswers {
    for (Buttons *answerButtons in _outletCollectionBtnAnswers)
        [(Buttons *) answerButtons formatButtonWithString:_arrAnswers[answerButtons.tag][1]];
    
    
}

- (IBAction)btnAnswerPressed:(id)sender {
}
@end
