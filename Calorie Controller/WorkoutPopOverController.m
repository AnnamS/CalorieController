//
//  WorkoutPopOverController.m
//  Calorie Controller
//
//  Created by Annam Siddique on 19/05/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import "WorkoutPopOverController.h"

@interface WorkoutPopOverController ()

@end

@implementation WorkoutPopOverController

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
    self.appDelegate = [[CalculatorAppDelegate alloc]init];
    self.exercises = [[NSMutableArray alloc] init];
    
    [self updateExerciseList];
    self.pickerWorkoutName.hidden = YES;
    self.btnDone.hidden = YES;
    
    self.lblNewWorkoutError.hidden = YES;
    
    NSLog(@"%@",self.date);
    
    // Do any additional setup after loading the view from its nib.
}

-(void)updateExerciseList
{
    [self.exercises removeAllObjects];
    NSMutableArray *exerciseRecords = [self.appDelegate fetchExerciseRecords];
    
    for (Exercise *exercise in exerciseRecords)
    {
        [self.exercises addObject:exercise.name];
        NSLog(@"%@", exercise.name);
    }

    self.lblWorkoutName.text = [self.exercises objectAtIndex:0];
    [self.pickerWorkoutName reloadAllComponents];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeWorkoutName:(id)sender
{
    self.pickerWorkoutName.hidden = NO;
    
    self.btnDone.hidden = NO;
    self.btnChangeWorkoutName.hidden = YES;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component
{
    
}

// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.exercises count];
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.exercises objectAtIndex:row];
}


- (IBAction)donePickingWorkoutName:(id)sender
{
    self.btnDone.hidden = YES;
    self.btnChangeWorkoutName.hidden = NO;
    self.pickerWorkoutName.hidden = YES;
    NSInteger row = [self.pickerWorkoutName selectedRowInComponent:0];
    self.lblWorkoutName.text = [self.exercises objectAtIndex:row];

}
- (IBAction)btnSaveWorkout:(id)sender
{
    if([self.tbTimeDistance.text isEqualToString:@""] ||[self.tbTimeDistance.text isEqualToString:nil])
    {
        self.lblNewWorkoutError.hidden = NO;
    }
    else
    {
        self.lblNewWorkoutError.hidden = YES;
        
        Workout *workout = (Workout *)[NSEntityDescription insertNewObjectForEntityForName:@"Workout" inManagedObjectContext:self.appDelegate.managedObjectContext];

        [workout setExerciseID:[self getExerciseId:self.lblWorkoutName.text]];
        [workout setDate:self.date];
        [workout setTimeDistance:self.tbTimeDistance.text];
        
        NSError *error;
        
        if(![self.appDelegate.managedObjectContext save:&error])
        {
            NSLog(@"Error");
            //This is a serious error saying the record
            //could not be saved. Advise the user to
            //try again or restart the application.
        }
        else
        {
            [self.workoutDelegate didAddWorkout:self];
        }
    }
}
-(NSString *)getExerciseId:(NSString *)exerciseName
{
    NSString *exerciseId = 0;
    NSMutableArray *exerciseRecords = [self.appDelegate fetchExerciseRecords];
    for(Exercise *exercise in exerciseRecords)
    {
        if([exercise.name isEqualToString:exerciseName])
        {
            exerciseId = exercise.id;
        }
    }
    
    return exerciseId;
}

- (IBAction)btnCancel:(id)sender
{
    [self.workoutDelegate didAddWorkout:self];
}
@end
