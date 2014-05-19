//
//  CalculatorAppDelegate.h
//  Calorie Controller
//
//  Created by Annam Siddique on 19/03/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Meal.h"
#import "Food.h"
#import "Workout.h"
#import "Exercise.h"
#import "User.h"

@interface CalculatorAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

-(void)saveToCoreData;

-(void)deleteUserRecords;
-(int)countUserRecords;
-(NSMutableArray *) fetchUserRecords;

-(int)countExerciseRecords;
-(NSMutableArray *) fetchExerciseRecords;

-(int)countWorkoutRecords;
-(NSMutableArray *) fetchWorkoutRecords;

-(int)countFoodRecords;
-(NSMutableArray *) fetchFoodRecords;

-(int)countMealRecords;
-(NSMutableArray *) fetchMealRecords;


@end
