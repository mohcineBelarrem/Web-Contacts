//
//  ContactsBook.m
//  WebContacts
//
//  Created by mohcine  on 7/14/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

#import "ContactsBook.h"

@implementation ContactsBook


-(id)init{
    
    self = [super init];
    
    if (self) {
    
        self.contactsFileLink = @"http://www.storage42.com/contacts.json";
        
        self.contactsList=[[NSMutableArray alloc]init];
        
        //self.picturesPaths=[[NSMutableArray alloc]init];
        
        self.myself=[[Contact alloc]init];
    }
    
    return self;
}


@end
