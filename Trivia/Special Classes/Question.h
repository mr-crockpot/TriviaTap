//
//  Question.h
//  Trivia
//
//  Created by Schor on 11/18/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property NSString *question;
@property NSArray *answers;
@property int correctAnswer;
@property int selectedAnswer;
- (NSString *)description;


@end
