//
//  ViewController.h
//  WebContacts
//
//  Created by mohcine  on 7/14/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Retriever.h"

/* As soon as the app launches this controller is alive so he will manage the behavior of the app by:
  -Controlling the loging in of the user 
  -Taking control of the other controllers such as
      =Contacts Retriever
      =Collection View Controller
      =Contact View Controller
      =Search View Controller */


@interface MasterController : UIViewController


@property (strong,nonatomic) Retriever *retriever;

/**/
//@property BOOL contactsHaveBeenRequested;

@end

