//
//  SpeedViewController.h
//  Trivia
//
//  Created by Adam Schor on 6/23/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpeedViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *outletCollectionbtnAnswers;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *outletCollectionLabelRank;
- (IBAction)btnAnswerPressed:(id)sender;

@property NSInteger labelNumber;
@property NSInteger labelTotal;
@property (strong, nonatomic) IBOutlet UIButton *btnSubmit;
- (IBAction)btnSubmitPressed:(id)sender;

@end
