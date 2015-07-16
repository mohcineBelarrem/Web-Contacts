//
//  CollectionController.m
//  WebContacts
//
//  Created by mohcine  on 7/14/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

#import "CollectionController.h"

@interface CollectionController ()

/* We need a connection with the master view controller
 because it's the class that will link us to the model
 */
@property (strong,nonatomic) MasterController *master;

@end

@implementation CollectionController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.master = ((MasterController *)self.presentingViewController);
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    //In a perfect world we should get this information from the model
    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    /* To get the number of cells we ask the retriever who will then ask the model So if there's a problem
     it' the retriever where we will look*/
    
    if(section==0) return 1;
    
    else return self.master.retriever.contactsBook.contactsList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    
    
    Contact *contactToBeShown;
    NSString *cellTitle;
    
    //we set the title of the cell
    UILabel *titleLabel= (UILabel *)[cell viewWithTag:100];
    
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:101];
    UIImage *cellImage;
    
    
    /* This method tells the collection View that there are two sections to be show 
     The first contains : "me"
     The second contains the other contacts
      
     And in each section we get the right information from the Model then we 
     write it in the cell label and image view */
    
    
    if(indexPath.section==0) {
        
        contactToBeShown = self.master.retriever.contactsBook.myself;
        
        cellTitle = [NSString stringWithFormat:@"%@ %@",contactToBeShown.name[@"last"],contactToBeShown.name[@"first"]];
        
        cellImage = [self.master.retriever getImageOfContactNumber:-1];
        
    } else {
        
        contactToBeShown = self.master.retriever.contactsBook.contactsList[indexPath.row];
        
        cellTitle = [NSString stringWithFormat:@"%@ %@",contactToBeShown.name[@"last"],contactToBeShown.name[@"first"]];
        
        cellImage = [self.master.retriever getImageOfContactNumber:(int)indexPath.row];
    }
    
    
    [titleLabel setText:cellTitle];
    
    //and then we set it's image
    
    [imageView setImage:cellImage];
    
    cell.layer.borderWidth=1.0f;
    cell.layer.borderColor=[UIColor blueColor].CGColor;
    
    return cell;
    
    
}



#pragma mark <UICollectionViewDelegate>


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //NSLog(@"%ld",indexPath.row);
    
    //This methods sets the informations for the tableController
    
    Contact *contactToBeDetailled;
    UIImage *contactImage;
    
    
    if(indexPath.section==0){
        
        //here we send "me" contact
        
        contactToBeDetailled = self.master.retriever.contactsBook.myself;
        
        contactImage = [self.master.retriever getImageOfContactNumber:-1];
        
        
    }else {
        
        //here we send one of the other contacts
        
        contactToBeDetailled = self.master.retriever.contactsBook.contactsList[indexPath.row];
        
        contactImage = [self.master.retriever getImageOfContactNumber:(int)indexPath.row];
        
    }
    
    self.contactToBeDetailled = contactToBeDetailled;
    self.contactImage = contactImage;
    
    [self performSegueWithIdentifier:@"detailSegue" sender:self];
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    if ([[segue identifier] isEqualToString:@"detailSegue"])
    {
        // Get reference to the destination view controller
        TableController *tableController = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        tableController.contactToBeDetailled = self.contactToBeDetailled;
        tableController.contactImage = self.contactImage;
        
    }
}

@end
