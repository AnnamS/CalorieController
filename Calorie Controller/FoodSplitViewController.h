//
//  FoodSplitViewController.h
//  Calorie Controller
//
//  Created by Annam Siddique on 24/03/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodDetailController.h"
#import "FoodMasterController.h"

@interface FoodSplitViewController : UISplitViewController <FoodMasterControllerDelegate>

@property (nonatomic,strong) UINavigationController *foodMasterNavigationController;
@property (nonatomic,strong) FoodMasterController *foodMasterController; 
@property (nonatomic,strong) FoodDetailController *foodDetailController;
@end
