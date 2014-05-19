//
//  CalculatorAppDelegate.m
//  Calorie Controller
//
//  Created by Annam Siddique on 19/03/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import "CalculatorAppDelegate.h"

@implementation CalculatorAppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self addFoodToCoreData];
    [self addExerciseToCoreData];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Core Data

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

// Returns the managed object context
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CalorieController" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
    
    
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CalorieController.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

-(void)saveToCoreData
{
    NSError *error;
    if(![self.managedObjectContext save:&error])
    {
        NSLog(@"Error");
        //This is a serious error saying the record
        //could not be saved. Advise the user to
        //try again or restart the application.
    }
    
}



//**************************** USER ****************************//

//DELETE USER RECORDS
-(void)deleteUserRecords
{
    
    //Name entity we want
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:self.managedObjectContext];
    
    //Get all records from that entity
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    //Sort by last name
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    //Put all records in array
    NSError *error;
    NSMutableArray *mutableFetchResults = [[self.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];

    //Go through array and delete all
    for (NSManagedObject *user in mutableFetchResults)
    {
        
        [self.managedObjectContext deleteObject:user];
    }

}


//COUNT USER
-(int)countUserRecords
{
    // Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:self.managedObjectContext];
    // Setup the fetch request
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    // Define how we will sort the records
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    // Fetch the records and handle any error
    NSError *error;
    NSMutableArray *mutableFetchResults = [[self.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (!mutableFetchResults) {
        // Handle the error.
        // This is a serious error and should advise the user to restart the application
    }
    return [mutableFetchResults count];
}

//FETCH USER
-(NSMutableArray *) fetchUserRecords
{
    // Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:self.managedObjectContext];
    // Setup the fetch request
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    // Define how we will sort the records
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"lastName" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    // Fetch the records and handle any error
    NSError *error;
    NSMutableArray *mutableFetchResults = [[self.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (!mutableFetchResults) {
        // Handle the error.
        // This is a serious error and should advise the user to restart the application
    }
    
    return mutableFetchResults;
}










//**************************** FOOD ****************************//
//ADD FOOD TO CORE DATA
-(void)addFoodToCoreData
{
    if([self countFoodRecords] == 0)
    {
        Food *food = (Food *)[NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:self.managedObjectContext];
        
        [food setId:@"1"];
        [food setName:@"Omelette"];
        [food setCalories:@"50"];
        [food setCategory:@"Breakfast"];
        
        Food *food2 = (Food *)[NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:self.managedObjectContext];
        
        [food2 setId:@"2"];
        [food2 setName:@"2 Slice Toast"];
        [food2 setCalories:@"20"];
        [food2 setCategory:@"Breakfast"];
        
        Food *food3 = (Food *)[NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:self.managedObjectContext];
        
        [food3 setId:@"3"];
        [food3 setName:@"Coco Pop"];
        [food3 setCalories:@"30"];
        [food3 setCategory:@"Breakfast"];
        
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
    
//    [self fetchFoodRecords];
    
    
}

//COUNT FOOD
-(int)countFoodRecords
{
    // Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Food" inManagedObjectContext:self.managedObjectContext];
    // Setup the fetch request
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    // Define how we will sort the records
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    // Fetch the records and handle any error
    NSError *error;
    NSMutableArray *mutableFetchResults = [[self.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (!mutableFetchResults) {
        // Handle the error.
        // This is a serious error and should advise the user to restart the application
    }
    return [mutableFetchResults count];
}

//FETCH FOOD
-(NSMutableArray *) fetchFoodRecords
{
    // Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Food" inManagedObjectContext:self.managedObjectContext];
    // Setup the fetch request
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    // Define how we will sort the records
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"category" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    // Fetch the records and handle any error
    NSError *error;
    NSMutableArray *mutableFetchResults = [[self.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (!mutableFetchResults) {
        // Handle the error.
        // This is a serious error and should advise the user to restart the application
    }
    
    return mutableFetchResults;

}

//COUNT MEAL
-(int)countMealRecords
{
    // Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Meal" inManagedObjectContext:self.managedObjectContext];
    // Setup the fetch request
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    // Define how we will sort the records
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    // Fetch the records and handle any error
    NSError *error;
    NSMutableArray *mutableFetchResults = [[self.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (!mutableFetchResults) {
        // Handle the error.
        // This is a serious error and should advise the user to restart the application
    }
    return [mutableFetchResults count];
}

//FETCH MEALS
-(NSMutableArray *) fetchMealRecords
{
    // Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Meal" inManagedObjectContext:self.managedObjectContext];
    // Setup the fetch request
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    // Define how we will sort the records
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    // Fetch the records and handle any error
    NSError *error;
    NSMutableArray *mutableFetchResults = [[self.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (!mutableFetchResults) {
        // Handle the error.
        // This is a serious error and should advise the user to restart the application
    }
    
    return mutableFetchResults;

}



//**************************** EXERCISE ****************************//
//ADD EXERCISE TO CORE DATA
-(void)addExerciseToCoreData
{
    
    if([self countExerciseRecords] == 0)
    {
        Exercise *exercise = (Exercise *)[NSEntityDescription insertNewObjectForEntityForName:@"Exercise" inManagedObjectContext:self.managedObjectContext];
        
        [exercise setId:@"1"];
        [exercise setName:@"Walking"];
        [exercise setCalories:@"50"];
        [exercise setUnits:@"Distance"];
        
        
        
        Exercise *exercise2 = (Exercise *)[NSEntityDescription insertNewObjectForEntityForName:@"Exercise" inManagedObjectContext:self.managedObjectContext];
        
        [exercise2 setId:@"2"];
        [exercise2 setName:@"Running"];
        [exercise2 setCalories:@"100"];
        [exercise2 setUnits:@"Distance"];
        
        Exercise *exercise3 = (Exercise *)[NSEntityDescription insertNewObjectForEntityForName:@"Exercise" inManagedObjectContext:self.managedObjectContext];
        
        
        [exercise3 setId:@"3"];
        [exercise3 setName:@"cycling"];
        [exercise3 setCalories:@"75"];
        [exercise3 setUnits:@"Distance"];
        
        Exercise *exercise4 = (Exercise *)[NSEntityDescription insertNewObjectForEntityForName:@"Exercise" inManagedObjectContext:self.managedObjectContext];
        
        
        [exercise4 setId:@"2"];
        [exercise4 setName:@"swimming"];
        [exercise4 setCalories:@"400"];
        [exercise4 setUnits:@"Distance"];
        
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

//COUNT EXERCISE
-(int)countExerciseRecords
{
    // Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Exercise" inManagedObjectContext:self.managedObjectContext];
    // Setup the fetch request
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    // Define how we will sort the records
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    // Fetch the records and handle any error
    NSError *error;
    NSMutableArray *mutableFetchResults = [[self.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (!mutableFetchResults) {
        // Handle the error.
        // This is a serious error and should advise the user to restart the application
    }
    return [mutableFetchResults count];
}

//FETCH EXERCISES
-(NSMutableArray *) fetchExerciseRecords
{
    // Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Exercise" inManagedObjectContext:self.managedObjectContext];
    // Setup the fetch request
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    // Define how we will sort the records
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    // Fetch the records and handle any error
    NSError *error;
    NSMutableArray *mutableFetchResults = [[self.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (!mutableFetchResults) {
        // Handle the error.
        // This is a serious error and should advise the user to restart the application
    }
    
    
    return mutableFetchResults;
}


//COUNT WORKOUT
-(int)countWorkoutRecords
{
    // Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Workout" inManagedObjectContext:self.managedObjectContext];
    // Setup the fetch request
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    // Define how we will sort the records
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    // Fetch the records and handle any error
    NSError *error;
    NSMutableArray *mutableFetchResults = [[self.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (!mutableFetchResults) {
        // Handle the error.
        // This is a serious error and should advise the user to restart the application
    }
    return [mutableFetchResults count];
}

//FETCH WORKOUT
-(NSMutableArray *) fetchWorkoutRecords
{
    // Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Workout" inManagedObjectContext:self.managedObjectContext];
    // Setup the fetch request
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    // Define how we will sort the records
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    // Fetch the records and handle any error
    NSError *error;
    NSMutableArray *mutableFetchResults = [[self.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (!mutableFetchResults) {
        // Handle the error.
        // This is a serious error and should advise the user to restart the application
    }
    
    return mutableFetchResults;
    
}

@end
