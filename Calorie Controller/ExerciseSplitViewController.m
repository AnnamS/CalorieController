//
//  ExerciseSplitViewController.m
//  Calorie Controller
//
//  Created by Annam Siddique on 24/03/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import "ExerciseSplitViewController.h"

@interface ExerciseSplitViewController ()

@end

@implementation ExerciseSplitViewController

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
    self.exerciseMasterNavigationController = [self.viewControllers objectAtIndex:0];
    self.exerciseMasterController = (ExerciseMasterController *)[self.exerciseMasterNavigationController topViewController];
    self.exerciseMasterController.exerciseDelegate = self;
    self.exerciseDetailController = [self.viewControllers objectAtIndex:1];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)exerciseMasterController:(ExerciseMasterController *)exerciseMasterController didChooseDate:(NSString *)date
{
    self.exerciseDetailController.date = date;
    [self.exerciseDetailController updateWorkoutList];
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
