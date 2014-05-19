//
//  WorkoutPopOverController.h
//  Calorie Controller
//
//  Created by Annam Siddique on 19/05/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorAppDelegate.h"
#import "Exercise.h"
#import "Workout.h"

@protocol WorkoutPopOverControllerDelegate;

@interface WorkoutPopOverController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) CalculatorAppDelegate *appDelegate;
@property (nonatomic, weak) id<WorkoutPopOverControllerDelegate> workoutDelegate;
@property (nonatomic, strong) NSMutableArray *exercises;

@property (weak, nonatomic) IBOutlet UIButton *btnChangeWorkoutName;
@property (weak, nonatomic) IBOutlet UITextField *tbTimeDistance;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerWorkoutName;
@property (weak, nonatomic) IBOutlet UILabel *lblWorkoutName;
@property (weak, nonatomic) IBOutlet UIButton *btnDone;
@property (weak, nonatomic) IBOutlet UILabel *lblNewWorkoutError;

@property (nonatomic,strong) NSString *date;
@end

@protocol WorkoutPopOverControllerDelegate <NSObject>

-(void)didAddWorkout:(WorkoutPopOverController *)workoutPopOverController;

@end