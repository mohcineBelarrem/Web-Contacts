//
//  ViewController.m
//  WebContacts
//
//  Created by mohcine  on 7/14/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

#import "MasterController.h"


@interface MasterController ()

@property (strong, nonatomic) IBOutlet UITextField *usernameField;

@property (strong, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)login:(id)sender;

@end

@implementation MasterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    //First thing we do is to try to load the contacts in the model
    
        self.retriever = [[Retriever alloc]init];
        [self.retriever fetchContacts];
    
    
    //At this point if everything well contacts are available
    
}


- (IBAction)login:(id)sender {
    
    
    if ([self.usernameField.text isEqualToString:@"test"]
        && [self.passwordField.text isEqualToString:@"test"]) {
        
        /*Here we can add the code for searching for the login and password by calling the retriever
         Who will then check in a file or in the Model */
        
        [self performSegueWithIdentifier:@"loginSegue" sender:self];
        
    } else {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Error"
                                                        message:@"Username or password Incorrect!"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
