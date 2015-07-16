//
//  Retriever.m
//  WebContacts
//
//  Created by mohcine  on 7/14/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

#import "Retriever.h"

@implementation Retriever


-(id)init{
    
    self = [super init];
    
    
    if(self){
        
        self.contactsBook = [[ContactsBook alloc]init];
        self.contactsLoaded=NO;
    }
    
    return self;
}


-(void)fetchContacts{
    
    
    @try {
        
        
        
        NSData *allContactsData = [[NSData alloc] initWithContentsOfURL:
                                   [NSURL URLWithString:self.contactsBook.contactsFileLink]];
        
        NSError *error;
        NSMutableDictionary *allContacts = [NSJSONSerialization
                                            JSONObjectWithData:allContactsData
                                            options:NSJSONReadingMutableContainers
                                            error:&error];
        
        
        
        
        
        
        //first we store the "me" from JSON in to the myself attribute of the contact book
        
        NSDictionary *myself = allContacts[@"me"];
        
        
        [self.contactsBook.myself   setGender:myself[@"gender"]
                                         Name:myself[@"name"]
                                     Location:myself[@"location"]
                                        Email:myself[@"email"]
                                     Username:myself[@"username"]
                                     Password:myself[@"password"]
                                        Phone:myself[@"phone"]
                                         Cell:myself[@"cell"]
                                          SSN:myself[@"SSN"]
                                      Picture:myself[@"picture"]];
        
        //Then we store the other contacts in the contacts List
        
        NSArray *otherContacts = allContacts[@"contacts"];
        
        for (NSDictionary *otherContact in otherContacts) {
            
            /*So for the other contacts that come from the JSON file
             we take each one which come in form of a NSDictionary we transform it into a contact obkject
             and then we store it into the contacts list*/
            
            Contact *otherContactObject = [[Contact alloc]init];
            
            [otherContactObject  setGender:otherContact[@"gender"]
                                      Name:otherContact[@"name"]
                                  Location:otherContact[@"location"]
                                     Email:otherContact[@"email"]
                                  Username:otherContact[@"username"]
                                  Password:otherContact[@"password"]
                                     Phone:otherContact[@"phone"]
                                      Cell:otherContact[@"cell"]
                                       SSN:otherContact[@"SSN"]
                                   Picture:otherContact[@"picture"]];
            
            [self.contactsBook.contactsList addObject:otherContactObject];
            
            
            
            self.contactsLoaded=YES;
            
            
        }
    }
    @catch (NSException *exception) {
        
        
        self.contactsLoaded=NO;
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Contacts Load error"
                                                        message:@"Couldn't load contacts please check your internet connection."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
        
        NSLog(@"%@",[exception reason]);
        
        
    }
    
    
    
    //NSLog(@"%@",self.contactsBook.myself);
    
    //NSLog(@"-------------------------------");
    
   // NSLog(@"%@",self.contactsBook.contactsList[3]);
    
    
    
}

-(UIImage *)getImageOfContactNumber:(int)contactNumber{
    
    
    Contact *contact;
    
    
    if(contactNumber ==-1) {
        
        //In case we want to use this method to get my Image
        
        contact = self.contactsBook.myself;
        
    } else {
    
      contact  = self.contactsBook.contactsList[contactNumber];
        
    }
    
    NSString *stringURL = contact.picture[@"medium"];
    
    NSURL *url = [NSURL URLWithString:stringURL];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [UIImage imageWithData:data];
    
    return img;
}



@end
