//
//  GameOverViewController.m
//  Trivia
//
//  Created by Schor on 11/18/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import "GameOverViewController.h"
#import "Question.h"


@interface GameOverViewController ()

@end

@implementation GameOverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _lblScore.text = [NSString stringWithFormat:@"%ld points", (long) _points];
    NSLog(@"%@", _questions);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    Question *q  = (Question *)_questions[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"myCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (q.correctAnswer == q.selectedAnswer)
        cell.contentView.backgroundColor = [UIColor greenColor];
    else
        cell.contentView.backgroundColor = [UIColor redColor];
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    
    cell.textLabel.text = [_questions[indexPath.row] description];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_questions count];
}

@end
