//
//  AddViewExerciseController.h
//  Calorie Controller
//
//  Created by Annam Siddique on 19/05/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorAppDelegate.h"
#import "ExerciseCell.h"
#import "Exercise.h"

@interface AddViewExerciseController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *tbNewExerciseName;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentNewExerciseUnits;
@property (weak, nonatomic) IBOutlet UITextField *tbNewExerciseCalLimit;
@property (weak, nonatomic) IBOutlet UILabel *lblNewExerciseError;

@property (nonatomic, strong) CalculatorAppDelegate *appDelegate;
@property (nonatomic, strong) NSMutableArray *availableExercise;
@end
