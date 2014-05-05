//
//  PersonalDetailsViewController.h
//  Calorie Controller
//
//  Created by Annam Siddique on 24/03/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "CalculatorAppDelegate.h"

@interface PersonalDetailsViewController : UIViewController

@property CalculatorAppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UITextField *tbFirstname;
@property (weak, nonatomic) IBOutlet UITextField *tbSurname;
@property (weak, nonatomic) IBOutlet UITextField *tbAge;
@property (weak, nonatomic) IBOutlet UITextField *tbGender;
@property (weak, nonatomic) IBOutlet UITextField *tbHeight;
@property (weak, nonatomic) IBOutlet UITextField *tbWeight;
@property (weak, nonatomic) IBOutlet UILabel *lblSaveUserError;

@end
