//
//  TableController.h
//  WebContacts
//
//  Created by mohcine  on 7/15/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
#import "CollectionController.h"

//The controller responsible for the TableView


@interface TableController : UITableViewController <UITableViewDataSource,UITableViewDelegate>


/*These are the informations  that we got from the CollectionViewController */
@property (strong,nonatomic) Contact *contactToBeDetailled;
@property (strong,nonatomic) UIImage *contactImage;

@end
