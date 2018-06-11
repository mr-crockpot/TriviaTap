//
//  PlayViewController.m
//  Trivia
//
//  Created by Adam Schor on 6/11/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import "PlayViewController.h"

@interface PlayViewController ()

@end

@implementation PlayViewController

- (void)viewDidLoad {
    _dbManager = [[DBManager alloc] initWithDatabaseFilename:@"trivia.db"];
    
    [self loadData];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Load Data
-(void)loadData{
    NSString *queryQuestion = @"SELECT * FROM questions ORDER BY RANDOM() LIMIT 1";
    _arrQuestion = [[NSMutableArray alloc] initWithArray:[_dbManager loadDataFromDB:queryQuestion]];
    
    
    NSString *queryData = @"SELECT * FROM data";
    _arrData = [[NSMutableArray alloc]initWithArray:[_dbManager loadDataFromDB:queryData]];
    
    NSLog(@"The array has %li elements",_arrData.count);
    NSLog(@"The topic is %@ and the question is %@",_arrQuestion[0][0],_arrQuestion[0][1]);
    
    
}

@end
