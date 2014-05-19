//
//  FoodMasterController.h
//  Calorie Controller
//
//  Created by Annam Siddique on 15/05/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatePopOverController.h"
#import "DateCell.h"
#import "FoodDetailController.h"
#import "Meal.h"
#import "CalculatorAppDelegate.h"

@protocol FoodMasterControllerDelegate;

@interface FoodMasterController : UITableViewController  <DatePopOverControllerDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *dates;
@property (nonatomic,strong) CalculatorAppDelegate *appDelegate;
@property (nonatomic, weak) id<FoodMasterControllerDelegate> foodDelegate;

@end


@protocol FoodMasterControllerDelegate <NSObject>

- (void)foodMasterController:(FoodMasterController*)foodMasterController
                didChooseDate:(NSString *)date;

@end
