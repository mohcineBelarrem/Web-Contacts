//
//  CollectionController.h
//  WebContacts
//
//  Created by mohcine  on 7/14/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterController.h"
#import "TableController.h"


//The controller responsible for the collectionView

@interface CollectionController : UICollectionViewController <UICollectionViewDataSource,UICollectionViewDelegate>


/*These are the informations about the contact to be detailled we make them accessible through 
  a public API so that the Table Controller can retrieve them easiy*/

@property (strong,nonatomic) Contact *contactToBeDetailled;
@property (strong,nonatomic) UIImage *contactImage;


@end
