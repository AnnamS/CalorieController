//
//  ExerciseCell.h
//  Calorie Controller
//
//  Created by Annam Siddique on 05/05/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExerciseCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblExerciseName;
@property (weak, nonatomic) IBOutlet UILabel *lblCalsPerKMOrMins;
@property (weak, nonatomic) IBOutlet UILabel *lblCalories;
@property (weak, nonatomic) IBOutlet UILabel *lblCalorieLimit;

@end
