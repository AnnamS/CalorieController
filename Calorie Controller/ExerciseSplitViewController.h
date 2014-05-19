//
//  ExerciseSplitViewController.h
//  Calorie Controller
//
//  Created by Annam Siddique on 24/03/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExerciseMasterController.h"
#import "ExerciseDetailController.h"

@interface ExerciseSplitViewController : UISplitViewController <ExerciseMasterControllerDelegate>

@property (nonatomic,strong) UINavigationController *exerciseMasterNavigationController;
@property (nonatomic,strong) ExerciseMasterController *exerciseMasterController;
@property (nonatomic,strong) ExerciseDetailController *exerciseDetailController;

@end
