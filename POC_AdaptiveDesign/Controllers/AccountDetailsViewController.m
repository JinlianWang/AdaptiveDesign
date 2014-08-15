//
//  AccountDetailsViewController.m
//  POC_AdaptiveDesign
//
//  Created by Wang, Jinlian on 6/25/14.
//  Copyright (c) 2014 capitalone. All rights reserved.
//

#import "AccountDetailsViewController.h"
#import "RewardsWidget.h"
#import "UIView+FillMe.h"
#import "AccountsService.h"

@interface AccountDetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *displayName;
@property (weak, nonatomic) IBOutlet UILabel *presentBalance;
@property (weak, nonatomic) IBOutlet RewardsWidget *rewardsWidget;

@end

@implementation AccountDetailsViewController

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
    
    /*Sunny: another way of creating a rewards widget, is to create a placeholder(UIView) in the view controller; 
     And then create an IBOutlet to the placeholder, say, rewardsPanel and then do the following in the viewDidLoad:
     
     RewardsWidget *rewards = [RewardsWidget rewardsWidget];
     rewards.account = self.account;
     [self.rewardsPanel C1FillMe:rewards];
    */
    
    self.rewardsWidget.account = self.account;
    
    self.displayName.text = self.account.accountName;
    self.presentBalance.text = self.account.presentBalance;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
