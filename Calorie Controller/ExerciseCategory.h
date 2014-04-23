//
//  ExerciseCategory.h
//  Calorie Controller
//
//  Created by Hasnat Hoque on 26/03/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExerciseCategoryWorkout.h"

@interface ExerciseCategory : NSObject

@property (nonatomic,strong) NSMutableDictionary *exerciseCategories;

-(void)addExercise:(ExerciseCategoryWorkout *)workout withName:(NSString*)name;
-(NSMutableDictionary *) returnExerciseCategories;
@end
