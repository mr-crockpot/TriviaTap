//
//  Validate.m
//  Trivia
//
//  Created by Adam Schor on 6/12/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import "Validate.h"

@implementation Validate


+(BOOL)validateEntriesWithLowEnd: (float) lowEnd highEnd:(float)highEnd arrayOfData: (NSMutableArray *)arrData{
    
        
    float answer1Rank = [arrData[0][3] floatValue ];
    float answer2Rank = [arrData[1][3] floatValue ];
    float rankDiff = ABS(answer1Rank-answer2Rank);
    
    if (rankDiff<highEnd && rankDiff>lowEnd) {
       
        return TRUE;
        
        //TRUE means proceed.
        
    }
    else{
        return FALSE;
        //FALSE means keep finding questions
    }
    
    
}

+(float)setHighEndForLevel: (NSInteger)level{
    
  /*  switch (level) {
        case 1:
            return 5;
            break;
        case 2:
            return 4;
            break;
        case 3:
            return 3;
            break;
        case 4:
            return 2;
            break;
        case 5:
            return 1;
            break;
        case 6:
            return 0.5;
            break;
        case 7:
            return 0.3;
            break;
        default:
            return 0.2;
            break;
    }*/
    return 5;
}

+(float)setLowEndForLevel: (NSInteger)level{
    float lowEnd;
    switch (level) {
        case 1:
            lowEnd= 2.5;
            break;
        case 2:
            lowEnd= 2;
            break;
        case 3:
            lowEnd= 1.5;
            break;
        case 4:
            lowEnd= 1;
            break;
        case 5:
            lowEnd= 0.5;
            break;
        case 6:
            lowEnd= 0.25;
            break;
        case 7:
            lowEnd= 0.15;
            break;
        default:
            lowEnd= 0.01;
            break;
    }
    return lowEnd;
}

@end
