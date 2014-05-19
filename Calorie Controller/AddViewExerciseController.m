//
//  AddViewExerciseController.m
//  Calorie Controller
//
//  Created by Annam Siddique on 19/05/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import "AddViewExerciseController.h"

@interface AddViewExerciseController ()

@end

@implementation AddViewExerciseController

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
    self.availableExercise = [self.appDelegate fetchExerciseRecords];
    self.lblNewExerciseError.hidden = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.availableExercise count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"ExerciseCell";
    
    ExerciseCell *cell = (ExerciseCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ExerciseCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    Exercise *current = [self.availableExercise objectAtIndex:indexPath.row];
    
    cell.lblExerciseName.text = current.name;
    cell.lblCalsPerKMOrMins.text = [NSString stringWithFormat:@"Cals/%@", current.units];
    cell.lblCalories.text = current.calories;
    
    return cell;
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

- (IBAction)done:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)addNewExercise:(id)sender
{
    if([self.tbNewExerciseName.text isEqualToString:@""] || [self.tbNewExerciseName.text isEqualToString:nil] ||
       [self.tbNewExerciseCalLimit.text isEqualToString:@""] || [self.tbNewExerciseCalLimit.text isEqualToString:nil])
    {
        self.lblNewExerciseError.text = @"Please Fill In ALL Fields";
        self.lblNewExerciseError.hidden = NO;
    }
    else
    {
        BOOL exists = NO;
        for (Exercise *exercise in self.availableExercise)
        {
            if([exercise.name isEqualToString:self.tbNewExerciseName.text])
            {
                exists = YES;
            }
        }
        
        if(exists == YES)
        {
            self.lblNewExerciseError.text = @"Food Already Exists";
            self.lblNewExerciseError.hidden = NO;
        }
        else
        {
            self.lblNewExerciseError.hidden = YES;
            Exercise *newExercise = (Exercise *)[NSEntityDescription insertNewObjectForEntityForName:@"Exercise" inManagedObjectContext:self.appDelegate.managedObjectContext];
            
            int exerciseCount = [self.appDelegate countExerciseRecords];
            exerciseCount++;
            [newExercise setId:[NSString stringWithFormat:@"%i",exerciseCount]];
            [newExercise setName:self.tbNewExerciseName.text];
            [newExercise setUnits:[self.segmentNewExerciseUnits titleForSegmentAtIndex:self.segmentNewExerciseUnits.selectedSegmentIndex]];
            
            NSError *error;
            if(![self.appDelegate.managedObjectContext save:&error])
            {
                NSLog(@"Error");
                //This is a serious error saying the record
                //could not be saved. Advise the user to
                //try again or restart the application.
            }
            
            self.availableExercise = [self.appDelegate fetchExerciseRecords];
            
            [self.tableView reloadData];
        }
        
        
    }

}
@end
