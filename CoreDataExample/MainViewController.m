//
//  MainViewController.m
//  CoreDataExample
//
//  Created by nunc03 on 12/24/13.
//  Copyright (c) 2013 Mithun Reddy. All rights reserved.
//

#import "MainViewController.h"
#import "UserDetails.h"
#import "TFAppDelegate.h"
@interface MainViewController ()

@end

@implementation MainViewController
@synthesize idtext;
@synthesize nametext;
@synthesize passwordtext;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    idtext.delegate = self;
    passwordtext.delegate = self;
    nametext.delegate = self;
    //tesrt
    self.navigationController.navigationBar.backgroundColor = [UIColor greenColor];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)deleteData:(id)sender {
    UserDetails *details;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"UserDetails"];
    NSError *err;
    if ([idtext.text  isEqual: @""]) {
        
    }else{
        NSPredicate *pre = [NSPredicate predicateWithFormat:@"userId == %@",idtext.text];
        [fetchRequest setPredicate:pre];
    }
    
    
    NSArray *array = [((TFAppDelegate *)([UIApplication sharedApplication].delegate)).managedObjectContext executeFetchRequest:fetchRequest error:&err];
    if ([array count]>0) {
        for (details in array) {
            
            NSLog(@"Details:%@,%@,%@",details.userPassword,details.userName,details.userId);
            [((TFAppDelegate *)([UIApplication sharedApplication].delegate)).managedObjectContext deleteObject:details];
            NSError *savingError = nil;
            if ([((TFAppDelegate *)([UIApplication sharedApplication].delegate)).managedObjectContext save:&savingError]){
                
                NSLog(@"Successfully deleted the last person in the array.");
            }else{
                    NSLog(@"Failed to delete the last person in the array.");
                }
            
            
        }
        
    }

    
}

- (IBAction)Insert:(id)sender {
    UserDetails *details = [NSEntityDescription insertNewObjectForEntityForName:@"UserDetails" inManagedObjectContext: ((TFAppDelegate *)([UIApplication sharedApplication].delegate)).managedObjectContext];
    if (details != nil) {
        details.userId = idtext.text;
        details.userName = nametext.text;
        details.userPassword = passwordtext.text;
    }
    NSError *error;
    if ([((TFAppDelegate *)([UIApplication sharedApplication].delegate)).managedObjectContext save:&error]) {
        
        NSLog(@"Saved Sucess Fully");
        idtext.text = nil;
        nametext.text = nil;
        passwordtext.text = nil;
        
    }
}

- (IBAction)fetchData:(id)sender {

    UserDetails *details;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"UserDetails"];
    NSError *err;
    if ([idtext.text  isEqual: @""]) {
        
    }else{
          NSPredicate *pre = [NSPredicate predicateWithFormat:@"userId == %@",idtext.text];
        [fetchRequest setPredicate:pre];
    }

    
    NSArray *array = [((TFAppDelegate *)([UIApplication sharedApplication].delegate)).managedObjectContext executeFetchRequest:fetchRequest error:&err];
    if ([array count]>0) {
        for (details in array) {
            
            NSLog(@"Details:%@,%@,%@",details.userPassword,details.userName,details.userId);
            idtext.text = details.userId;
            nametext.text = details.userName;
            passwordtext.text = details.userPassword;
            
        }
        
    }else{
        idtext.text = nil;
        nametext.text = nil;
        passwordtext.text = nil;

    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
@end
