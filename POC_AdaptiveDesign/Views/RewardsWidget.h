//
//  RewardsWidget.h
//  POC_AdaptiveDesign
//
//  Created by Wang, Jinlian on 6/26/14.
//  Copyright (c) 2014 capitalone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Account.h"

@interface RewardsWidget : UIView

@property(nonatomic, strong) Account* account;

+ (instancetype) rewardsWidget;

-(instancetype)initWithAccount:(Account *)account;

@end
