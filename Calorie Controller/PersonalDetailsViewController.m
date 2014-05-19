//
//  PersonalDetailsViewController.m
//  Calorie Controller
//
//  Created by Annam Siddique on 24/03/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import "PersonalDetailsViewController.h"
#import "CalculatorAppDelegate.h"

@interface PersonalDetailsViewController ()

@end

@implementation PersonalDetailsViewController
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
    appDelegate = [[CalculatorAppDelegate alloc]init];
    self.lblSaveUserError.hidden = YES;
    if([appDelegate countUserRecords] != 0)
    {
        User *user = [[appDelegate fetchUserRecords] objectAtIndex:0];
        self.tbFirstname.text = user.firstName;
        self.tbSurname.text = user.lastName;
        self.tbAge.text = user.age;
        self.tbGender.text = user.gender;
        self.tbHeight.text = user.height;
        self.tbWeight.text = user.weight;
    }
    
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)btnSaveUser:(id)sender
{
    if(([self.tbFirstname.text isEqualToString:@""])
       || ([self.tbSurname.text isEqualToString:@""])
       || ([self.tbAge.text isEqualToString:@""])
       || ([self.tbGender.text isEqualToString:@""])
       || ([self.tbHeight.text isEqualToString:@""])
       || ([self.tbWeight.text isEqualToString:@""]))
    {
        //All fields not filled in
        self.lblSaveUserError.hidden = NO;
    }
    else
    {
        //Save to Core Data
        self.lblSaveUserError.hidden = YES;
       
        if([appDelegate countUserRecords] != 0)
        {
            [appDelegate deleteUserRecords];
        }
        
        User *user = (User *)[NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:appDelegate.managedObjectContext];
        [user setFirstName:self.tbFirstname.text];
        [user setLastName:self.tbSurname.text];
        [user setAge:self.tbAge.text];
        [user setGender:self.tbGender.text];
        [user setHeight:self.tbHeight.text];
        [user setWeight:self.tbWeight.text];
        
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
