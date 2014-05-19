//
//  ExerciseMasterController.h
//  Calorie Controller
//
//  Created by Annam Siddique on 18/05/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatePopOverController.h"
#import "DateCell.h"
#import "ExerciseDetailController.h"
#import "Workout.h"
#import "CalculatorAppDelegate.h"

@protocol ExerciseMasterControllerDelegate;

@interface ExerciseMasterController : UITableViewController  <DatePopOverControllerDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *dates;
@property (nonatomic,strong) CalculatorAppDelegate *appDelegate;
@property (nonatomic, weak) id<ExerciseMasterControllerDelegate> exerciseDelegate;

@end

@protocol ExerciseMasterControllerDelegate <NSObject>

- (void)exerciseMasterController:(ExerciseMasterController*)exerciseMasterController
               didChooseDate:(NSString *)date;

@end