//
//  PersonalDetailsViewController.m
//  Calorie Controller
//
//  Created by Annam Siddique on 24/03/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import "PersonalDetailsViewController.h"
#import "CalculatorAppDelegate.h"

@interface PersonalDetailsViewController ()
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@end

@implementation PersonalDetailsViewController
@synthesize managedObjectContext;
@synthesize managedObjectModel;
@synthesize persistentStoreCoordinator;

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
     NSLog(@"loaded");
    [super viewDidLoad];
    
    CalculatorAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    managedObjectContext = [appDelegate managedObjectContext];
    managedObjectModel = [appDelegate managedObjectModel];
    
    [self addFoodToCoreData];
    [self addExerciseToCoreData];
    // Do any additional setup after loading the view.
}

-(void)addFoodToCoreData
{
    if([self countFoodRecords] == 0)
    {
        Food *food = (Food *)[NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:managedObjectContext];
        
        [food setId:@"1"];
        [food setName:@"Omelette"];
        [food setCalories:@"50"];
        [food setCategory:@"breakfast"];
        
        Food *food2 = (Food *)[NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:self.managedObjectContext];
        
        [food2 setId:@"2"];
        [food2 setName:@"2 Slice Toast"];
        [food2 setCalories:@"20"];
        [food2 setCategory:@"breakfast"];
        
        Food *food3 = (Food *)[NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:self.managedObjectContext];
        
        [food3 setId:@"3"];
        [food3 setName:@"Coco Pop"];
        [food3 setCalories:@"30"];
        [food3 setCategory:@"breakfast"];
        
        Food *food4 = (Food *)[NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:self.managedObjectContext];
        
        [food4 setId:@"4"];
        [food4 setName:@"Ceaser Salad"];
        [food4 setCalories:@"75"];
        [food4 setCategory:@"Lunch"];
        
        Food *food5 = (Food *)[NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:self.managedObjectContext];
        
        [food5 setId:@"5"];
        [food5 setName:@"Turkey Sandwich"];
        [food5 setCalories:@"120"];
        [food5 setCategory:@"Lunch"];
        
        Food *food6 = (Food *)[NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:self.managedObjectContext];
        
        [food6 setId:@"6"];
        [food6 setName:@"Lamb Wrap"];
        [food6 setCalories:@"150"];
        [food6 setCategory:@"Lunch"];
        
        Food *food7 = (Food *)[NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:self.managedObjectContext];
        
        [food7 setId:@"7"];
        [food7 setName:@"Shepard's Pie"];
        [food7 setCalories:@"300"];
        [food7 setCategory:@"Dinner"];
        
        Food *food8 = (Food *)[NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:self.managedObjectContext];
        
        [food8 setId:@"8"];
        [food8 setName:@"Fish and Chips"];
        [food8 setCalories:@"500"];
        [food8 setCategory:@"Dinner"];
        
        Food *food9 = (Food *)[NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:self.managedObjectContext];
        
        [food9 setId:@"9"];
        [food9 setName:@"Lasagne"];
        [food9 setCalories:@"200"];
        [food9 setCategory:@"Dinner"];
        
        Food *food10 = (Food *)[NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:self.managedObjectContext];
        
        [food10 setId:@"10"];
        [food10 setName:@"Coke"];
        [food10 setCalories:@"75"];
        [food10 setCategory:@"Drinks"];
        
        Food *food11 = (Food *)[NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:self.managedObjectContext];
        
        [food11 setId:@"11"];
        [food11 setName:@"Orange Juice"];
        [food11 setCalories:@"25"];
        [food11 setCategory:@"Drinks"];
        
        Food *food12 = (Food *)[NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:self.managedObjectContext];
        
        [food12 setId:@"12"];
        [food12 setName:@"Apple Juice"];
        [food12 setCalories:@"75"];
        [food12 setCategory:@"Drinks"];
        
        Food *food13 = (Food *)[NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:self.managedObjectContext];
        
        [food13 setId:@"13"];
        [food13 setName:@"Crisp: Salt and Vinegar"];
        [food13 setCalories:@"100"];
        [food13 setCategory:@"Snacks"];
        
        Food *food14 = (Food *)[NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:self.managedObjectContext];
        
        [food14 setId:@"14"];
        [food14 setName:@"Apple"];
        [food14 setCalories:@"10"];
        [food14 setCategory:@"Snacks"];
        
        Food *food15 = (Food *)[NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:self.managedObjectContext];
        
        [food15 setId:@"15"];
        [food15 setName:@"Milk Chocolate"];
        [food15 setCalories:@"10"];
        [food15 setCategory:@"Snacks"];
        
        NSError *error;
        if(![self.managedObjectContext save:&error])
        {
            NSLog(@"Error");
            //This is a serious error saying the record
            //could not be saved. Advise the user to
            //try again or restart the application.
        }
    }
    
    [self fetchFoodRecords];
   

}


-(int)countFoodRecords
{
    // Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Food" inManagedObjectContext:managedObjectContext];
    // Setup the fetch request
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    // Define how we will sort the records
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    // Fetch the records and handle any error
    NSError *error;
    NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (!mutableFetchResults) {
        // Handle the error.
        // This is a serious error and should advise the user to restart the application
    }
    return [mutableFetchResults count];
}

-(void) fetchFoodRecords
{
    // Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Food" inManagedObjectContext:managedObjectContext];
    // Setup the fetch request
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    // Define how we will sort the records
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    // Fetch the records and handle any error
    NSError *error;
    NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (!mutableFetchResults) {
        // Handle the error.
        // This is a serious error and should advise the user to restart the application
    }
    
    for(int i = 0; i < [mutableFetchResults count]; i++)
    {
        Food *f = [mutableFetchResults objectAtIndex:i];
        NSLog(@"%@",f.name);
    }
}


-(void)addExerciseToCoreData
{
    
    if([self countExerciseRecords] == 0)
    {
      //  Exercise *exercise = (Exercise *)[NSEntityDescription insertNewObjectForEntityForName:@"Exercise" inManagedObjectContext:managedObjectContext];
        
    //        [exercise setId:@"1"];
//        [exercise setName:@"Walking"];
//        [exercise setCalories:@"50"];
//        [exercise setUnits:@"Distance"];
       
        
        
        //Exercise *exercise2 = (Exercise *)[NSEntityDescription insertNewObjectForEntityForName:@"Exercise" inManagedObjectContext:managedObjectContext];
        
        //        [exercise2 setId:@"2"];
        //        [exercise2 setName:@"Running"];
        //        [exercise2 setCalories:@"100"];
        //        [exercise2 setUnits:@"Distance"];
        
        
        
        //        [exercise2 setId:@"3"];
        //        [exercise2 setName:@"Running"];
        //        [exercise2 setCalories:@"150"];
        //        [exercise2 setUnits:@"Distance"];
        
        
        
        
        NSError *error;
        if(![self.managedObjectContext save:&error])
        {
            NSLog(@"Error");
            //This is a serious error saying the record
            //could not be saved. Advise the user to
            //try again or restart the application.
        }
    }
    
    [self fetchExerciseRecords];
    

}

-(int)countExerciseRecords
{
    // Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Exercise" inManagedObjectContext:managedObjectContext];
    // Setup the fetch request
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    // Define how we will sort the records
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    // Fetch the records and handle any error
    NSError *error;
    NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (!mutableFetchResults) {
        // Handle the error.
        // This is a serious error and should advise the user to restart the application
    }
    return [mutableFetchResults count];
}

-(void) fetchExerciseRecords
{
    // Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Exercise" inManagedObjectContext:managedObjectContext];
    // Setup the fetch request
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    // Define how we will sort the records
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    // Fetch the records and handle any error
    NSError *error;
    NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (!mutableFetchResults) {
        // Handle the error.
        // This is a serious error and should advise the user to restart the application
    }
    
    for(int i = 0; i < [mutableFetchResults count]; i++)
    {
        Food *f = [mutableFetchResults objectAtIndex:i];
        NSLog(@"%@",f.name);
    }
}

//-(void)setUpExerciseCategories
//{
//    self.exerciseCategories = [[ExerciseCategory alloc] init];
//    
//    //   ************* Walking *************
//    ExerciseCategoryWorkout *workoutOne = [[ExerciseCategoryWorkout alloc] init];
//    workoutOne.units = @"Distance";
//    workoutOne.calories = @"100";
//    [self.exerciseCategories addExercise:workoutOne withName:@"Walking"];
//    
//    //   ************* Running *************
//    ExerciseCategoryWorkout *workoutTwo = [[ExerciseCategoryWorkout alloc] init];
//    workoutTwo.units = @"Distance";
//    workoutTwo.calories = @"50";
//    [self.exerciseCategories addExercise:workoutTwo withName:@"Running"];
//    
//    //   ************* Cycling *************
//    ExerciseCategoryWorkout *workoutThree = [[ExerciseCategoryWorkout alloc] init];
//    workoutThree.units = @"Distance";
//    workoutThree.calories = @"75";
//    [self.exerciseCategories addExercise:workoutThree withName:@"Cycling"];
//
//    //   ************* Cycling *************
//    ExerciseCategoryWorkout *workoutFour = [[ExerciseCategoryWorkout alloc] init];
//    workoutFour.units = @"Distance";
//    workoutFour.calories = @"400";
//    [self.exerciseCategories addExercise:workoutFour withName:@"Swimming"];
//    
//    //   ************* Show Exercise Categories *************
//    [self.exerciseCategories returnExerciseCategories];
//}

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

@end
