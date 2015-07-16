//
//  Contact.h
//  WebContacts
//
//  Created by mohcine  on 7/14/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

#import <Foundation/Foundation.h>

//A class to store contacts in form of an object

@interface Contact : NSObject


//Atributes
//In a perfect world name,location and picture should be Classes
@property (nonatomic,strong) NSString *gender;
@property (nonatomic,strong) NSDictionary *name;
@property (nonatomic,strong) NSDictionary *location;
@property (nonatomic,strong) NSString *email;
@property (nonatomic,strong) NSString *username;
@property (nonatomic,strong) NSString *password;
@property (nonatomic,strong) NSString *phone;
@property (nonatomic,strong) NSString *cell;
@property (nonatomic,strong) NSString *ssn;
@property (nonatomic,strong) NSDictionary *picture;



//Constructor
- (void)setGender:(NSString *)gender
             Name:(NSDictionary*)name
         Location:(NSDictionary*)location
            Email:(NSString*)email
         Username:(NSString*)username
         Password:(NSString*)password
            Phone:(NSString*)phone
             Cell:(NSString*)cell
              SSN:(NSString*)ssn
          Picture:(NSDictionary*)picture;

//mtehod to print contact object to console helps with the debugging
-(NSString*)description;

@end
