//
//  UIView+FillMe.m
//  POC_AdaptiveDesign
//
//  Created by Wang, Jinlian on 6/27/14.
//  Copyright (c) 2014 capitalone. All rights reserved.
//

#import "UIView+FillMe.h"

@implementation UIView(FillMe)

-(void)C1FillMe:(UIView*)subview{
    [self addSubview:subview];
    subview.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *views = @{@"subview" : subview};
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[subview]|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[subview]|" options:0 metrics:nil views:views]];
}

@end
