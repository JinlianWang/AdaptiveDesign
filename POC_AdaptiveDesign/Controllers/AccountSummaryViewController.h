//
//  AccountSummaryViewController.h
//  POC_AdaptiveDesign
//
//  Created by Wang, Jinlian on 6/24/14.
//  Copyright (c) 2014 capitalone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountSummaryViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray* accounts;

@end
