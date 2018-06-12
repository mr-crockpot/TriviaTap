//
//  Validate.h
//  Trivia
//
//  Created by Adam Schor on 6/12/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validate : NSObject

+(BOOL)validateEntriesWithLowEnd: (float) lowEnd highEnd:(float)highEnd arrayOfData: (NSMutableArray *)arrData;

+(float)setHighEndForLevel: (NSInteger)level;

+(float)setLowEndForLevel: (NSInteger)level;

@end
