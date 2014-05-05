//
//  iPhonePersonalDetailsViewController.h
//  Calorie Controller
//
//  Created by Redwanul Islam on 05/05/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "CalculatorAppDelegate.h"

@interface iPhonePersonalDetailsViewController : UIViewController

@property CalculatorAppDelegate *appDelegate;

@property (weak, nonatomic) IBOutlet UITextField *tbFirstName;
@property (weak, nonatomic) IBOutlet UITextField *tbLastName;
@property (weak, nonatomic) IBOutlet UITextField *tbAge;
@property (weak, nonatomic) IBOutlet UITextField *tbGender;
@property (weak, nonatomic) IBOutlet UITextField *tbHeight;
@property (weak, nonatomic) IBOutlet UITextField *tbWeight;
@property (weak, nonatomic) IBOutlet UILabel *lblSaveUserError;

@end
