//  AppDelegate.m
//  POC_AdaptiveDesign
//
//  Created by Wang, Jinlian on 6/24/14.
//  Copyright (c) 2014 capitalone. All rights reserved.
//

#import "TraitOverrideViewController.h"
#import "AccountSummaryViewController.h"
#import "AccountDetailsViewController.h"
#import "UIView+FillMe.h"

#define REGULAR_WIDTH_THRESHOLD 800

@interface TraitOverrideViewController ()
@property (copy, nonatomic) UITraitCollection *forcedTraitCollection;
@end

@implementation TraitOverrideViewController

- (void) determineForcedTraitCollection:(CGSize)size{
    if (size.width > size.height) {
        self.forcedTraitCollection = [UITraitCollection traitCollectionWithHorizontalSizeClass:UIUserInterfaceSizeClassRegular];
    } else {
        self.forcedTraitCollection = [UITraitCollection traitCollectionWithHorizontalSizeClass:UIUserInterfaceSizeClassCompact];;
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self determineForcedTraitCollection:self.view.bounds.size];
}


- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator
{
    [self determineForcedTraitCollection:size];
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

- (void)updateForcedTraitCollection
{
    [self setOverrideTraitCollection:self.forcedTraitCollection forChildViewController:self.viewController];
}

- (void)setViewController:(UIViewController *)viewController
{
    if (_viewController != viewController) {
        if (_viewController) {
            [_viewController willMoveToParentViewController:nil];
            [self setOverrideTraitCollection:nil forChildViewController:_viewController];
            [_viewController.view removeFromSuperview];
            [_viewController removeFromParentViewController];
        }
        
        if (viewController) {
            [self addChildViewController:viewController];
        }
        _viewController = viewController;
        
        if (_viewController) {
            [self.view C1FillMe:_viewController.view];
            [_viewController didMoveToParentViewController:self];
            
            [self updateForcedTraitCollection];
        }
    }
}

- (void)setForcedTraitCollection:(UITraitCollection *)forcedTraitCollection
{
    if (_forcedTraitCollection != forcedTraitCollection) {
        _forcedTraitCollection = [forcedTraitCollection copy];
        [self updateForcedTraitCollection];
    }
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
    return YES;
}

- (BOOL)shouldAutomaticallyForwardRotationMethods
{
    return YES;
}

@end
