//
//  RewardsWidget.m
//  POC_AdaptiveDesign
//
//  Created by Wang, Jinlian on 6/26/14.
//  Copyright (c) 2014 capitalone. All rights reserved.
//

#import "RewardsWidget.h"
#import "UIView+FillMe.h"

@interface RewardsWidget()
@property (weak, nonatomic) IBOutlet UILabel *milesAmountLabel;
@end

@implementation RewardsWidget

+ (instancetype) rewardsWidget{
    RewardsWidget *rewards = [[RewardsWidget alloc] init];
    return rewards;
}

- (instancetype) initWithAccount:(Account *)account{
    self = [super init];
    if(self){
        [self boostRewardWidget];
        [self setAccount:account];
    }
    return self;
}

- (instancetype) init{
    return [self initWithAccount:nil];
}

- (BOOL) isBoosted{
    return self.subviews && [self.subviews count] > 0;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    if(![self isBoosted]){
        [self boostRewardWidget];
    }
}

-(void)setAccount:(Account *)account{
    _account = account;
    [self refreshUIFromAccount:account];
}

-(void) boostRewardWidget{
    UIView *rewards = [[[NSBundle mainBundle] loadNibNamed:@"RewardsWidget" owner:self options:nil] objectAtIndex:0];
    rewards.backgroundColor = [UIColor clearColor];
    rewards.layer.borderColor = [[UIColor colorWithRed:118/255.0f green:118/255.0f blue:118/255.0f alpha:1] CGColor];
    rewards.layer.borderWidth = 1.0f;
    [self C1FillMe:rewards];
}

-(void)refreshUIFromAccount:(Account *)account{
    self.milesAmountLabel.text = account.milesAmount;
}

@end
