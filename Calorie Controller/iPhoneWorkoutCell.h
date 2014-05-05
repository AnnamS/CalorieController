//
//  iPhoneWorkoutCell.h
//  Calorie Controller
//
//  Created by Redwanul Islam on 05/05/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iPhoneWorkoutCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblCalories;
@property (weak, nonatomic) IBOutlet UILabel *lblDistanceOrTime;
@property (weak, nonatomic) IBOutlet UILabel *lblMinsOrKM;

@end
