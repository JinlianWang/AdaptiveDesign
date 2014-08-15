//
//  AccountsService.h
//  POC_AdaptiveDesign
//
//  Created by Wang, Jinlian on 7/1/14.
//  Copyright (c) 2014 capitalone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"

@interface AccountsService : NSObject

+ (AccountsService *) getInstance;

- (NSArray *) getAccounts;

- (Account *) getPreviousAccount:(Account *)account;
- (Account *) getNextAccount:(Account *)account;
- (NSInteger) getAccountIndex:(Account *)account;

@end
