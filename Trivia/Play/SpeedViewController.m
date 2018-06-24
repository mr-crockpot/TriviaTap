//
//  SpeedViewController.m
//  Trivia
//
//  Created by Adam Schor on 6/23/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import "SpeedViewController.h"

@interface SpeedViewController ()

@end

@implementation SpeedViewController

- (void)viewDidLoad {
    
    _labelNumber = 0;
    _btnSubmit.enabled = NO;
    
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
            
        }
        _labelTotal = _labelTotal + [labelRanks.text integerValue];
       
        
    }
     NSLog(@"label total %li",_labelTotal);
    if (_labelTotal == 10) {
        _btnSubmit.enabled = YES;
    }
    else {
        _btnSubmit.enabled = NO;
    }
    
    _labelTotal = 0;
}
- (IBAction)btnSubmitPressed:(id)sender {
}
@end
