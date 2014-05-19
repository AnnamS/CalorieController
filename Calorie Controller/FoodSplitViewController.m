//
//  FoodSplitViewController.m
//  Calorie Controller
//
//  Created by Annam Siddique on 24/03/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import "FoodSplitViewController.h"

@interface FoodSplitViewController ()

@end

@implementation FoodSplitViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.foodMasterNavigationController = [self.viewControllers objectAtIndex:0];
    self.foodMasterController = (FoodMasterController *)[self.foodMasterNavigationController topViewController];
    self.foodMasterController.foodDelegate = self;
    self.foodDetailController = [self.viewControllers objectAtIndex:1];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)foodMasterController:(FoodMasterController *)foodMasterController didChooseDate:(NSString *)date
{
    self.foodDetailController.date = date;
    [self.foodDetailController updateMealList];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
