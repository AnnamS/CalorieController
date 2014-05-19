//
//  AddViewFoodController.h
//  Calorie Controller
//
//  Created by Annam Siddique on 18/05/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorAppDelegate.h"
#import "FoodCell.h"
#import "Food.h"

@interface AddViewFoodController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) CalculatorAppDelegate *appDelegate;
@property (nonatomic, strong) NSMutableArray *availableFood;
@property (weak, nonatomic) IBOutlet UISegmentedControl *categorySelector;
@property (weak, nonatomic) IBOutlet UITextField *tbNewFoodName;
@property (weak, nonatomic) IBOutlet UITextField *tbNewFoodCalories;
@property (weak, nonatomic) IBOutlet UILabel *lblNewFoodError;
@end
