//
//  MealPopOverController.h
//  Calorie Controller
//
//  Created by Annam Siddique on 19/05/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorAppDelegate.h"
#import "Food.h"
#import "Meal.h"

@protocol MealPopOverControllerDelegate;


@interface MealPopOverController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) CalculatorAppDelegate *appDelegate;
@property (nonatomic, weak) id<MealPopOverControllerDelegate> mealDelegate;

@property (weak, nonatomic) IBOutlet UISegmentedControl *mealCategory;
@property (weak, nonatomic) IBOutlet UILabel *lblMealName;
@property (weak, nonatomic) IBOutlet UITextField *tbMealWeight;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerMealName;
@property (weak, nonatomic) IBOutlet UIButton *btnChangeMealName;
@property (weak, nonatomic) IBOutlet UIButton *btnDoneMealName;
@property (weak, nonatomic) IBOutlet UILabel *lblNewMealError;

@property (nonatomic, strong) NSMutableArray *foodCategories;
@property (nonatomic, strong) NSMutableArray *foodNameFromCategory;

@property (nonatomic,strong) NSString *date;
@end

@protocol MealPopOverControllerDelegate <NSObject>

- (void)didAddMeal: (MealPopOverController*)mealPopOverController;

@end