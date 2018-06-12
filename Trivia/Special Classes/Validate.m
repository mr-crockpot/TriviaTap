//
//  Validate.m
//  Trivia
//
//  Created by Adam Schor on 6/12/18.
//  Copyright © 2018 AandA Development. All rights reserved.
//

#import "Validate.h"

@implementation Validate


-(BOOL)validateEntriesWithLowEnd: (float) lowEnd highEnd:(float)highEnd arrayOfData: (NSMutableArray *)arrData{
   
    
    float answer1 = [arrData[0][2] floatValue ];
    float answer2 = [arrData[1][2] floatValue ];
    float absValDiff = ABS(answer1/answer2 -1);
    
    if (absValDiff<highEnd && absValDiff>lowEnd) {
        return TRUE;
        //TRUE means proceed.
        
    }
    else{
        return FALSE;
        //FALSE means keep finding questions
    }
    
    
}

-(float)setHighEnd: (NSInteger)level{
    return 5;
}

-(float)setLowEnd: (NSInteger)level{
    return 1;
    
}

@end
