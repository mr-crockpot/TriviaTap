//
//  GameOverViewController.h
//  Trivia
//
//  Created by Schor on 11/18/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameOverViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UILabel *lblScore;
@property NSInteger points;
@property NSMutableArray *questions;
@end
