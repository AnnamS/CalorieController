//
//  FoodDetailController.h
//  Calorie Controller
//
//  Created by Annam Siddique on 17/05/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodMasterController.h"
#import "AddViewFoodController.h"
#import "MealPopOverController.h"
#import "CalculatorAppDelegate.h"
#import "MealCell.h"
#import "Food.h"
#import "Meal.h"

@interface FoodDetailController : UIViewController <MealPopOverControllerDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *btnAddNewMeal;

@property (weak, nonatomic) IBOutlet UIButton *btnAddViewFood;
@property (nonatomic,strong) CalculatorAppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *graphView;

@property(nonatomic,strong) NSString *date;
@property (nonatomic, strong) NSMutableArray *meals;

-(void)updateMealList;

@end
