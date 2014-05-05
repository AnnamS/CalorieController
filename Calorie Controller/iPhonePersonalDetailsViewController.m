//
//  iPhonePersonalDetailsViewController.m
//  Calorie Controller
//
//  Created by Redwanul Islam on 05/05/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import "iPhonePersonalDetailsViewController.h"

@interface iPhonePersonalDetailsViewController ()

@end

@implementation iPhonePersonalDetailsViewController
@synthesize appDelegate;

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
	// Do any additional setup after loading the view.
    self.lblSaveUserError.hidden=YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(dismissKeyboard)];
    //you can further configure this if you wish
    [self.view addGestureRecognizer:tap];
}
//add this selector/method
- (void)dismissKeyboard
{
    //these are the name of the text fields that might have the keyboard as first responder so edit as necessary for your names
    [self.tbFirstName resignFirstResponder];
    [self.tbLastName resignFirstResponder];
    [self.tbAge resignFirstResponder];
    [self.tbGender resignFirstResponder];
    [self.tbHeight resignFirstResponder];
    [self.tbWeight resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnSaveUser:(id)sender
{
    if(([self.tbFirstName.text isEqualToString:@""]) ||
       ([self.tbLastName.text isEqualToString:@""])  ||
       ([self.tbAge.text isEqualToString:@""])  ||
       ([self.tbGender.text isEqualToString:@""])  ||
       ([self.tbHeight.text isEqualToString:@""])  ||
       ([self.tbWeight.text isEqualToString:@""]))
    {
        self.lblSaveUserError.hidden=NO;
    }
    else
    {
        self.lblSaveUserError.hidden=YES;
        
        //Save to Core Data
        
        if([appDelegate countUserRecords] != 0)
        {
            [appDelegate deleteUserRecords];
        }
        
        User *user = (User *)[NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:appDelegate.managedObjectContext];
        
        [user setFirstName:self.tbFirstName.text];
        [user setLastName:self.tbFirstName.text];
        [user setAge:self.tbFirstName.text];
        [user setGender:self.tbFirstName.text];
        [user setHeight:self.tbFirstName.text];
        [user setWeight:self.tbFirstName.text];
        
        NSError *error;
        if(![appDelegate.managedObjectContext save:&error])
        {
            NSLog(@"Error");
            //This is a serious error saying the record
            //could not be saved. Advise the user to
            //try again or restart the application.
        }
        
    }
}



@end
