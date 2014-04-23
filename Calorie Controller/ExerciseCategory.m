//
//  ExerciseCategory.m
//  Calorie Controller
//
//  Created by Hasnat Hoque on 26/03/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import "ExerciseCategory.h"

@implementation ExerciseCategory
@synthesize exerciseCategories = _exerciseCategories;

-( NSMutableDictionary *) exerciseCategories
{
    if (!_exerciseCategories)
    {
        _exerciseCategories = [[NSMutableDictionary alloc] init];
    }
    return _exerciseCategories;
}

-(void)addExercise:(ExerciseCategoryWorkout *)workout withName:(NSString*)name
{
    [self.exerciseCategories setObject:workout forKey:name];
}

-(NSMutableDictionary *) returnExerciseCategories
{
//    ExerciseCategoryWorkout *q = [self.exerciseCategories objectForKey:@"Walking"];
//    NSLog(@"%@",q.calories);
//    
//    ExerciseCategoryWorkout *w = [self.exerciseCategories objectForKey:@"Cycling"];
//    NSLog(@"%@",w.calories);
//    
//    ExerciseCategoryWorkout *e = [self.exerciseCategories objectForKey:@"Running"];
//    NSLog(@"%@",e.calories);
//    
//    ExerciseCategoryWorkout *r = [self.exerciseCategories objectForKey:@"Swimming"];
//    NSLog(@"%@",r.calories);
//    
    return self.exerciseCategories;
}

@end
