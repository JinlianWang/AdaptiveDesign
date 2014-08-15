//
//  AccountCollectionViewCell.m
//  POC_AdaptiveDesign
//
//  Created by Wang, Jinlian on 6/24/14.
//  Copyright (c) 2014 capitalone. All rights reserved.
//

#import "AccountCollectionViewCell.h"
@interface AccountCollectionViewCell()
@property (weak, nonatomic) IBOutlet UILabel *displayName;
@property (weak, nonatomic) IBOutlet UILabel *currentBalance;

@end

@implementation AccountCollectionViewCell

- (void)awakeFromNib
{
    // Initialization code
    self.layer.borderColor = [[UIColor blackColor] CGColor];
    self.layer.borderWidth = 1.0f;
}

-(void)refreshUIFromAccount:(Account*)account{
    self.displayName.text = account.accountName;
    self.currentBalance.text = account.presentBalance;
}

@end
