//
//  AccountSummaryCompactLayout.m
//  POC_AdaptiveDesign
//
//  Created by Wang, Jinlian on 6/24/14.
//  Copyright (c) 2014 capitalone. All rights reserved.
//

#import "AccountSummaryAdaptiveLayout.h"

#define CELL_PADDING 20
#define TOTAL_CELLS 6
#define STATUS_BAR_HEIGHT 64

@implementation AccountSummaryAdaptiveLayout{
    NSInteger itemWidth;
    NSInteger itemHeight;
}

-(void)prepareLayout{
    [super prepareLayout];
    itemWidth = (self.collectionView.frame.size.width - CELL_PADDING)/[self.collectionView numberOfItemsInSection:0] - CELL_PADDING;
    itemHeight = (self.collectionView.frame.size.height - STATUS_BAR_HEIGHT)*[self.collectionView numberOfItemsInSection:0]/6 - CELL_PADDING;
}

-(CGSize)collectionViewContentSize {
    return CGSizeMake(self.collectionView.frame.size.width, self.collectionView.frame.size.height - STATUS_BAR_HEIGHT);
    //iOS 8 bug: somehow when the collection view controller is pushed into a navigation controller with navigation bar, the frame/bounds are no longer returned correctly.
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)path {
    UICollectionViewLayoutAttributes* attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:path];
    attributes.size = CGSizeMake(itemWidth,itemHeight);
    attributes.center = CGPointMake(itemWidth/2 + path.row * (itemWidth + CELL_PADDING) + CELL_PADDING, itemHeight/2 + path.section * (itemHeight + CELL_PADDING));
    return attributes;
}

-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray* attributes = [NSMutableArray array];
    UICollectionViewLayoutAttributes *attrs = nil;
    for(NSInteger i=0 ; i < [self.collectionView numberOfSections]; i++) {
        for (NSInteger j=0 ; j < [self.collectionView numberOfItemsInSection:i]; j++) {
            NSIndexPath* indexPath = [NSIndexPath indexPathForItem:j inSection:i];
            attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
            if(!CGRectIsEmpty(CGRectIntersection(attrs.frame, rect))){
                [attributes addObject:attrs];
            }
        }
    }
    return attributes;
}

@end
