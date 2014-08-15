//
//  AccountPageViewController.m
//  POC_AdaptiveDesign
//
//  Created by Wang, Jinlian on 7/1/14.
//  Copyright (c) 2014 capitalone. All rights reserved.
//

#import "AccountPageViewController.h"
#import "AccountDetailsViewController.h"
#import "AccountsService.h"

@interface AccountPageViewController ()
    @property (nonatomic, strong) NSMutableDictionary *detailsControllerMap;
@end

@implementation AccountPageViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataSource = self;
    self.delegate = self;
    self.detailsControllerMap = [[NSMutableDictionary alloc] init];
    
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    AccountDetailsViewController *detailsController = (AccountDetailsViewController *)viewController;
    Account *account = [[AccountsService getInstance] getPreviousAccount:detailsController.account];
    if(account){
        NSString *key = [NSString stringWithFormat:@"%li",(long)[[AccountsService getInstance] getAccountIndex:account]];
        AccountDetailsViewController *previous = [self.detailsControllerMap objectForKey:key];
        if(!previous){
            previous = [[AccountDetailsViewController alloc] init];
            previous.account = account;
            [self.detailsControllerMap setObject:previous forKey:key];
        }
        return previous;
    } else {
        return nil;
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    AccountDetailsViewController *detailsController = (AccountDetailsViewController *)viewController;
    Account *account = [[AccountsService getInstance] getNextAccount:detailsController.account];
    if(account){
        NSString *key = [NSString stringWithFormat:@"%li",(long)[[AccountsService getInstance] getAccountIndex:account]];
        AccountDetailsViewController *next = [self.detailsControllerMap objectForKey:key];
        if(!next){
            next = [[AccountDetailsViewController alloc] init];
            next.account = account;
            [self.detailsControllerMap setObject:next forKey:key];
        }
        return next;
    } else {
        return nil;
    }
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [[AccountsService getInstance] getAccounts].count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return self.startIndex;
}

@end
