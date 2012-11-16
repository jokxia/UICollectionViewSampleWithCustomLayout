//
//  KViewController.h
//  CollectionViewSample
//
//  Created by karsa wang on 12-11-14.
//  Copyright (c) 2012年 karsa wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>{
    IBOutlet    UICollectionView        *_collectionView;
}

@end
