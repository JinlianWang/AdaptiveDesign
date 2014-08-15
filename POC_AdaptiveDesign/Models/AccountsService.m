//
//  AccountsService.m
//  POC_AdaptiveDesign
//
//  Created by Wang, Jinlian on 7/1/14.
//  Copyright (c) 2014 capitalone. All rights reserved.
//

#import "AccountsService.h"
@interface AccountsService()
@property (strong, nonatomic) NSArray *accounts;
@end

@implementation AccountsService

+ (AccountsService *) getInstance{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (NSArray *) getAccounts{
    if(!_accounts){
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        Account *acc = [[Account alloc] init];
        acc.accountName = @"Capital One Checking";
        acc.presentBalance = @"$111.23";
        acc.milesAmount = @"3,000";
        
        
        [arr addObject:acc];
        
        acc = [[Account alloc] init];
        acc.accountName = @"Capital One Saving";
        acc.presentBalance = @"$235.66";
        acc.milesAmount = @"6,000";
        [arr addObject:acc];
        
        acc = [[Account alloc] init];
        acc.accountName = @"Capital One Saving";
        acc.presentBalance = @"$335.66";
        acc.milesAmount = @"9,000";
        [arr addObject:acc];
        
        acc = [[Account alloc] init];
        acc.accountName = @"Capital One Saving";
        acc.presentBalance = @"$435.66";
        acc.milesAmount = @"30,000";
        [arr addObject:acc];
        
        acc = [[Account alloc] init];
        acc.accountName = @"Capital One Saving";
        acc.presentBalance = @"$535.66";
        acc.milesAmount = @"60,000";
        [arr addObject:acc];
        
        acc = [[Account alloc] init];
        acc.accountName = @"Capital One Saving";
        acc.milesAmount = @"90,000";
        acc.presentBalance = @"$635.66";
        [arr addObject:acc];
        _accounts = arr;
    }
    return _accounts;
}

- (Account *) getNextAccount:(Account *)account{
    NSInteger idx = [self getAccountIndex:account];
    return idx < (self.accounts.count-1) ? [self.accounts objectAtIndex:(idx+1)] : nil;
}

- (Account *) getPreviousAccount:(Account *)account{
    NSInteger idx = [self getAccountIndex:account];
    return idx > 0 ? [self.accounts objectAtIndex:(idx-1)] : nil;
}

- (NSInteger) getAccountIndex:(Account *)account{
    return [self.accounts indexOfObject:account];
}
@end
