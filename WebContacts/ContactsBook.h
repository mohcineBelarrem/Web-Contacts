//
//  ContactsBook.h
//  WebContacts
//
//  Created by mohcine  on 7/14/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"


/* This is the real model iwt will store The list of contacts and The "me"
   And in case the app becomes Internet Connection dependent it should store the path 
   for the JSON file */

@interface ContactsBook : NSObject


//attributes
@property (strong,nonatomic) NSString *contactsFileLink;

@property (strong,nonatomic) NSMutableArray *contactsList;

@property (strong,nonatomic) Contact *myself;

//In case we want to download the images 
//@property (strong,nonatomic) NSMutableArray *picturesPaths;

//methods
-(id)init;

@end
