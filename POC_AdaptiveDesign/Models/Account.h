//
//  Account.h
//  POC_AdaptiveDesign
//
//  Created by Wang, Jinlian on 6/24/14.
//  Copyright (c) 2014 capitalone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject

@property (assign, nonatomic) NSInteger accountIndex;
@property (retain,nonatomic) NSString *accountName;
@property (retain,nonatomic) NSNumber *creditLimit;
@property (retain,nonatomic) NSNumber *availCredit;
@property (retain, nonatomic) NSString *presentBalance;
@property (retain, nonatomic) NSNumber *plasticID;
@property (retain, nonatomic) NSString *milesAmount;

@end
