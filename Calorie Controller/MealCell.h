//
//  MealCell.h
//  Calorie Controller
//
//  Created by Annam Siddique on 05/05/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MealCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblCategory;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblCalories;
@property (weak, nonatomic) IBOutlet UILabel *lblWeight;

@property (weak, nonatomic) IBOutlet UILabel *lblCalsPerGram;

@end
