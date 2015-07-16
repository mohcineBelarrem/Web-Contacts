//
//  TableController.m
//  WebContacts
//
//  Created by mohcine  on 7/15/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

#import "TableController.h"

@interface TableController ()

//This is the controller that told us to detail a contact
@property (strong,nonatomic) CollectionController *sourceController;

//Full name of the contact
@property (strong,nonatomic) NSString *contactFullName;

//Address,ssn,email...
@property (strong,nonatomic) NSMutableArray *contactInfos;

@end

@implementation TableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.contactInfos = [[NSMutableArray alloc]init];
    
    [self processContactInfos];
    
    //NSLog(@"%ld",self.contactInfos.count);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)processContactInfos{
    
    //This method makes it easiy for the cells to retreive informations
    
    self.contactFullName = [NSString stringWithFormat:@"%@ %@ %@",self.contactToBeDetailled.name[@"title"],
                            self.contactToBeDetailled.name[@"last"],
                            self.contactToBeDetailled.name[@"first"]];
    
    /*Contact Infos array will contain all the other informations about the contact formatted into strings
     So that they can be easily written on the cells of the section "2" (third section) of the tableView */
    
    NSString *contactInfo;
    
    //processing SSN
    contactInfo = [NSString stringWithFormat:@"SSN : %@",self.contactToBeDetailled.ssn];
    [self.contactInfos addObject:contactInfo];
    
    //Same thing with the other infos
    contactInfo = [NSString stringWithFormat:@"Email : %@",self.contactToBeDetailled.email];
    [self.contactInfos addObject:contactInfo];
    
    contactInfo = [NSString stringWithFormat:@"Cell : %@",self.contactToBeDetailled.cell];
    [self.contactInfos addObject:contactInfo];
    
    contactInfo = [NSString stringWithFormat:@"Phone : %@",self.contactToBeDetailled.phone];
    [self.contactInfos addObject:contactInfo];
    
    contactInfo = [NSString stringWithFormat:@"Username : %@",self.contactToBeDetailled.username];
    [self.contactInfos addObject:contactInfo];
    
    contactInfo = [NSString stringWithFormat:@"Password : %@",self.contactToBeDetailled.password];
    [self.contactInfos addObject:contactInfo];
    
    contactInfo = [NSString stringWithFormat:@"Address : %@ %@ %@ %@",self.contactToBeDetailled.location[@"street"]
                                                                     ,self.contactToBeDetailled.location[@"city"]
                                                                     ,self.contactToBeDetailled.location[@"state"]
                                                                     ,self.contactToBeDetailled.location[@"zip"]];
    [self.contactInfos addObject:contactInfo];
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //Returns the number of cells per section
    
    if (section == 0 || section == 1 ) return 1;
    
    else return 7;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    
    
    if(indexPath.section==0){
        
        cell= [tableView dequeueReusableCellWithIdentifier:@"backButtonCell" forIndexPath:indexPath];
        
        
        
    } else if (indexPath.section==1){
        
        cell= [tableView dequeueReusableCellWithIdentifier:@"nameCell" forIndexPath:indexPath];
        
        //putting the name of the contact on the label
        UILabel *label = (UILabel *)[cell.contentView viewWithTag:201];
        
        
        [label setText:self.contactFullName];
        
        UIImageView *imageView = (UIImageView *)[cell.contentView viewWithTag:202];
        [imageView setImage:self.contactImage];
        
        
    } else {
        
        cell= [tableView dequeueReusableCellWithIdentifier:@"normalCell" forIndexPath:indexPath];
        
        UILabel *label = (UILabel *)[cell.contentView viewWithTag:203];
        label.numberOfLines=2;
        [label setText:self.contactInfos[indexPath.row]];
        
    }
    
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==1) {
        
        return  150.0;
    } else {
        
        if (indexPath.row==6) {
            return 100.0;
        } else {
            
            return 70.0;
        }
    }
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //NSLog(@"%ld",indexPath.row);
    
    if (indexPath.section==0) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}





@end
