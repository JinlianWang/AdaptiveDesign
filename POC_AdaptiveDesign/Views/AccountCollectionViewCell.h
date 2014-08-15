//
//  AccountCollectionViewCell.h
//  POC_AdaptiveDesign
//
//  Created by Wang, Jinlian on 6/24/14.
//  Copyright (c) 2014 capitalone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Account.h"

@interface AccountCollectionViewCell : UICollectionViewCell

-(void)refreshUIFromAccount:(Account*)account;

@end
