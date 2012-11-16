//
//  KViewController.m
//  CollectionViewSample
//
//  Created by karsa wang on 12-11-14.
//  Copyright (c) 2012年 karsa wang. All rights reserved.
//

#import "KViewController.h"
#import "KLayout.h"

@interface KViewController ()

@end

@implementation KViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _collectionView.backgroundColor = [UIColor redColor];
    
//    UINib *cellNib = [UINib nibWithNibName:@"NibCell" bundle:nil];
//    [_collectionView registerNib:cellNib forCellWithReuseIdentifier:@"simpleCell"];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"simpleCell"];
    
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    [flowLayout setItemSize:CGSizeMake(90, 90)];
//    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
//    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
//    [_collectionView setCollectionViewLayout:flowLayout];
    
    KLayout *layout = [[KLayout alloc] init];
    [_collectionView setCollectionViewLayout:layout];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"simpleCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blueColor];
//    ((UILabel *)[cell viewWithTag:10]).text = [NSString stringWithFormat:@"{%d,%d}", indexPath.section, indexPath.row];
    return cell;
}

@end
