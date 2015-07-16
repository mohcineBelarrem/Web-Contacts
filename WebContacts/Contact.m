//
//  Contact.m
//  WebContacts
//
//  Created by mohcine  on 7/14/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

#import "Contact.h"

@implementation Contact



- (void)setGender:(NSString *)gender
             Name:(NSDictionary*)name
         Location:(NSDictionary*)location
            Email:(NSString*)email
         Username:(NSString*)username
         Password:(NSString*)password
            Phone:(NSString*)phone
             Cell:(NSString*)cell
              SSN:(NSString*)ssn
          Picture:(NSDictionary*)picture{
    
    
    self.gender=gender;
    self.name=name;
    self.location=location;
    self.email=email;
    self.username=username;
    self.password=password;
    self.phone=phone;
    self.cell=cell;
    self.ssn=ssn;
    self.picture=picture;
    
    
    
}

-(NSString *)description {
    
    return [NSString stringWithFormat:@"Contact description:\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n",
                                        self.gender,
                                        self.name,
                                        self.location,
                                        self.email,
                                        self.username,
                                        self.password,
                                        self.phone,
                                        self.cell,
                                        self.ssn,
                                        self.picture];
    
}


@end


