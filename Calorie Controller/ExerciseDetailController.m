//
//  ExerciseDetailController.m
//  Calorie Controller
//
//  Created by Annam Siddique on 17/05/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import "ExerciseDetailController.h"

@interface ExerciseDetailController ()
{
    WorkoutPopOverController *controller;
    UIPopoverController *popoverController;
}
@end

@implementation ExerciseDetailController

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
    controller = [[WorkoutPopOverController alloc] initWithNibName:@"WorkoutPopOverController" bundle:nil];
    controller.workoutDelegate = self;
    popoverController = [[UIPopoverController alloc] initWithContentViewController:controller];
    
    self.workouts = [[NSMutableArray alloc]init];
    self.appDelegate = [[CalculatorAppDelegate alloc]init];
    [self updateWorkoutList];
    // Do any additional setup after loading the view.
}

-(void)updateWorkoutList
{
    NSMutableArray *workoutRecords = [self.appDelegate fetchWorkoutRecords];
    
    [self.workouts removeAllObjects];
    
    for (Workout *workout in workoutRecords)
    {
        if([workout.date isEqualToString:self.date])
        {
            [self.workouts addObject:workout];
        }
    }
    [self.tableView reloadData];
    
}

-(void)didAddWorkout:(WorkoutPopOverController *)workoutPopOverController
{
    [popoverController dismissPopoverAnimated:YES];
    [self updateWorkoutList];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)addNewWorkout:(id)sender
{
    if ([popoverController isPopoverVisible])
    {
        [popoverController dismissPopoverAnimated:YES];
    }
    else
    {
        // Assign self as the delegate for the child view controller
        //        popoverController.delegate = self;
        controller.date = self.date;
        popoverController.popoverContentSize = CGSizeMake(411, 436);
        [popoverController presentPopoverFromRect:CGRectMake(0, 0, 411, 436)
                                           inView:self.view
                         permittedArrowDirections:UIPopoverArrowDirectionLeft
                                         animated:YES];
    }

}


- (IBAction)addViewExercise:(id)sender {
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.workouts count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *dateCellIdentifier = @"WorkoutCell";
    
    WorkoutCell *cell = (WorkoutCell *)[tableView dequeueReusableCellWithIdentifier:dateCellIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"WorkoutCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    Workout *currentWorkout = [self.workouts objectAtIndex:indexPath.row];
    Exercise *currentExercise = [self getExerciseUsingId:currentWorkout.exerciseID];
   
    cell.lblExerciseName.text = currentExercise.name;
    
    return cell;
}

-(Exercise *)getExerciseUsingId:(NSString *)exerciseID
{
    NSMutableArray *exerciseRecords = [self.appDelegate fetchExerciseRecords];
    for(Exercise *exercise in exerciseRecords)
    {
        if([exercise.id isEqualToString:exerciseID])
        {
            return exercise;
        }
    }
    
    return nil;
    
}

@end
