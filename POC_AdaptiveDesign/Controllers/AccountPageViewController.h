//
//  AccountPageViewController.h
//  POC_AdaptiveDesign
//
//  Created by Wang, Jinlian on 7/1/14.
//  Copyright (c) 2014 capitalone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountPageViewController : UIPageViewController<UIPageViewControllerDataSource, UIPageViewControllerDelegate>
    @property(assign, nonatomic) NSInteger startIndex;
@end
