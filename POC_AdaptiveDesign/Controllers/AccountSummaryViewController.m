//
//  AccountSummaryViewController.m
//  POC_AdaptiveDesign
//
//  Created by Wang, Jinlian on 6/24/14.
//  Copyright (c) 2014 capitalone. All rights reserved.
//

#import "AccountSummaryViewController.h"
#import "AccountCollectionViewCell.h"
#import "AccountSummaryAdaptiveLayout.h"
#import "AppDelegate.h"
#import "AccountDetailsViewController.h"
#import "AccountsService.h"
#import "AccountPageViewController.h"

#define ACCOUNT_CELL_REUSE_IDENTIFIER @"ACCOUNT_CELL_REUSE_IDENTIFIER"
#define SHOW_DETAILS_SEGUE_IDENTIFIER @"ShowAccountDetails"

@interface AccountSummaryViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *accountCollectionView;

@end

@implementation AccountSummaryViewController

#pragma mark - View Controller Initialization

- (instancetype)initWithAccounts:(NSArray *)accounts{
    self = [super init];
    if(self){
        _accounts = accounts;
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - View Controller Lifecycles

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.accountCollectionView registerNib:[UINib nibWithNibName:@"AccountCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:ACCOUNT_CELL_REUSE_IDENTIFIER];
    AccountSummaryAdaptiveLayout *layout = [[AccountSummaryAdaptiveLayout alloc] init];
    
    [self.accountCollectionView setCollectionViewLayout:layout animated:YES];
    
    self.accounts = [[AccountsService getInstance] getAccounts];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self numberOfColumns];
}

- (NSInteger) numberOfColumns{
    NSInteger no =  (self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassRegular) ? 3 : 2;
    return no;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.accounts ? self.accounts.count/[self numberOfColumns]: 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    AccountCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ACCOUNT_CELL_REUSE_IDENTIFIER forIndexPath:indexPath];
    [cell refreshUIFromAccount:[self.accounts objectAtIndex:(indexPath.section * [self numberOfColumns] + indexPath.row)]];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:SHOW_DETAILS_SEGUE_IDENTIFIER sender:indexPath];
}

#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSIndexPath *indexPath = (NSIndexPath *)sender;
    NSInteger index = (indexPath.section * [self numberOfColumns] + indexPath.row);
    AccountPageViewController *pageController = (AccountPageViewController *) segue.destinationViewController;
    pageController.startIndex = index;
    AccountDetailsViewController *detailsController = [[AccountDetailsViewController alloc] init];
    detailsController.account = [self.accounts objectAtIndex:index];
    [pageController setViewControllers:[NSArray arrayWithObjects:detailsController, nil] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}

#pragma mark - UITraitContainer

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    [self.accountCollectionView reloadData];
}

@end
