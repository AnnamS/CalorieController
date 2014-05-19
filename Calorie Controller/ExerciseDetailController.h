//
//  ExerciseDetailController.h
//  Calorie Controller
//
//  Created by Annam Siddique on 17/05/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExerciseMasterController.h"
//#import "AddViewExerciseController.h"
#import "WorkoutPopOverController.h"
#import "CalculatorAppDelegate.h"
#import "WorkoutCell.h"
#import "Exercise.h"
#import "Workout.h"

@interface ExerciseDetailController : UIViewController <WorkoutPopOverControllerDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *btnAddNewWorkout;
@property (nonatomic,strong) CalculatorAppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *graphView;

@property (weak, nonatomic) IBOutlet UILabel *lblWorkouts;
@property (weak, nonatomic) IBOutlet UILabel *lblGraphView;

@property(nonatomic,strong) NSString *date;
@property (nonatomic, strong) NSMutableArray *workouts;

-(void)updateWorkoutList;
@end
