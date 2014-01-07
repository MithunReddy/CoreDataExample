//
//  MainViewController.h
//  CoreDataExample
//
//  Created by nunc03 on 12/24/13.
//  Copyright (c) 2013 Mithun Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *idtext;
@property (weak, nonatomic) IBOutlet UITextField *nametext;
@property (weak, nonatomic) IBOutlet UITextField *passwordtext;
- (IBAction)deleteData:(id)sender;
- (IBAction)Insert:(id)sender;
- (IBAction)fetchData:(id)sender;
@end
