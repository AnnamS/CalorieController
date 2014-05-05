//
//  WorkoutCell.h
//  Calorie Controller
//
//  Created by Annam Siddique on 05/05/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorkoutCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblExerciseName;
@property (weak, nonatomic) IBOutlet UILabel *lblCalsLost;
@property (weak, nonatomic) IBOutlet UILabel *lblKMOrMins;
@property (weak, nonatomic) IBOutlet UILabel *lblDistanceOrTime;

@end
