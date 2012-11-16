//
//  KLayout.m
//  CollectionViewSample
//
//  Created by karsa wang on 12-11-15.
//  Copyright (c) 2012年 karsa wang. All rights reserved.
//

#import "KLayout.h"

@implementation KLayout

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {

    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attr.frame = CGRectMake(10 + ([self itemSize].width + 10) * indexPath.row, 10, 90, 90);
    return attr;
}

- (CGSize)collectionViewContentSize {
    NSInteger rows = [self.collectionView numberOfItemsInSection:0];
    return CGSizeMake(10 + rows * ([self itemSize].width + 10), 110);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (CGSize)itemSize {
    return CGSizeMake(90, 90);
}

- (NSIndexPath *)indexPathOfCellAtPoint:(CGPoint)point {
    NSInteger row = ceil((point.x-10)/([self itemSize].width + 10));
    if (row < 0) {
        row = 0;
    }
    return [NSIndexPath indexPathForItem:row inSection:0];
}

- (NSArray *)indexPathArrayForVisibleRect:(CGRect)rect {
    NSInteger start = [self indexPathOfCellAtPoint:rect.origin].row;
    NSInteger end = [self indexPathOfCellAtPoint:CGPointMake(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height)].row;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:(end - start + 1)];
    for (int i = start ; i <= end; i ++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [array addObject:indexPath];
    }
    return array;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *indexPathes = [self indexPathArrayForVisibleRect:rect];
    NSMutableArray *attrArray = [NSMutableArray arrayWithCapacity:indexPathes.count];
    for (NSIndexPath *indexPath in indexPathes) {
        UICollectionViewLayoutAttributes *attr = [self layoutAttributesForItemAtIndexPath:indexPath];
        [attrArray addObject:attr];
    }
    return attrArray;
}



@end
