//
//  Question.m
//  Trivia
//
//  Created by Schor on 11/18/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import "Question.h"

@implementation Question

- (NSString *)description {
    
    return [NSString stringWithFormat:@"Question: %@\nAnswers: %@\nYour Answer: %@\nCorrect Answer: %@", _question, [_answers componentsJoinedByString:@", "], _answers[_selectedAnswer], _answers[_correctAnswer] ];
}

@end
