//
//  PlayViewController.h
//  Trivia
//
//  Created by Adam Schor on 6/11/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface PlayViewController : UIViewController

@property (strong,nonatomic) DBManager *dbManager;

@property (strong, nonatomic) NSMutableArray *arrData;
@property (strong, nonatomic) NSMutableArray *arrQuestion;

@end
