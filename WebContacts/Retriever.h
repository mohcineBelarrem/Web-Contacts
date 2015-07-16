//
//  Retriever.h
//  WebContacts
//
//  Created by mohcine  on 7/14/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ContactsBook.h"

/*This is the controller that fetches the contacts data from the JSON file */

@interface Retriever : NSObject

//attributes
@property (strong,nonatomic) ContactsBook *contactsBook;

@property BOOL contactsLoaded;

//methods
-(id)init;
-(void)fetchContacts;

-(UIImage *)getImageOfContactNumber:(int)contactNumber;

@end
