//
//  FoodDetailController.m
//  Calorie Controller
//
//  Created by Annam Siddique on 17/05/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import "FoodDetailController.h"

@interface FoodDetailController ()
{
    MealPopOverController *controller;
    UIPopoverController *popoverController;
}
@end

@implementation FoodDetailController

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
    controller = [[MealPopOverController alloc] initWithNibName:@"MealPopOverController" bundle:nil];
    controller.mealDelegate = self;
    popoverController = [[UIPopoverController alloc] initWithContentViewController:controller];
    
    self.meals = [[NSMutableArray alloc]init];
    self.appDelegate = [[CalculatorAppDelegate alloc]init];
    [self updateMealList];
    // Do any additional setup after loading the view.

}

-(void)updateMealList
{
    NSMutableArray *mealRecords = [self.appDelegate fetchMealRecords];
    
    [self.meals removeAllObjects];
    
    for (Meal *meal in mealRecords)
    {
        if([meal.date isEqualToString:self.date])
        {
            [self.meals addObject:meal];
        }
    }
    [self.tableView reloadData];
    
}

-(void)didAddMeal:(MealPopOverController *)mealPopOverController
{
    [popoverController dismissPopoverAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (IBAction)addNewMeal:(id)sender
{
    if ([popoverController isPopoverVisible])
    {
        [popoverController dismissPopoverAnimated:YES];
    }
    else
    {
        // Assign self as the delegate for the child view controller
        //        popoverController.delegate = self;
            controller.date = self.date;
        popoverController.popoverContentSize = CGSizeMake(411, 436);
        [popoverController presentPopoverFromRect:CGRectMake(0, 0, 411, 436)
                                           inView:self.view
                         permittedArrowDirections:UIPopoverArrowDirectionLeft
                                         animated:YES];
    }

}

- (IBAction)addViewFood:(id)sender
{
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.meals count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *dateCellIdentifier = @"MealCell";
    
    MealCell *cell = (MealCell *)[tableView dequeueReusableCellWithIdentifier:dateCellIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MealCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    Meal *currentMeal = [self.meals objectAtIndex:indexPath.row];
    Food *currentFood = [self getFoodUsingId:currentMeal.foodID];
    
    cell.lblCategory.text = currentFood.category;
    cell.lblName.text = currentFood.name;
    cell.lblCalsPerGram.text = currentFood.calories;
    float calories = ([currentFood.calories floatValue] / 100) * [currentMeal.weight floatValue];
    cell.lblCalories.text = [NSString stringWithFormat:@"%.2f",calories];
    cell.lblWeight.text = currentMeal.weight;
    
    return cell;
}

-(Food *)getFoodUsingId:(NSString *)foodId
{
    NSMutableArray *foodRecords = [self.appDelegate fetchFoodRecords];
    for(Food *food in foodRecords)
    {
        if([food.id isEqualToString:foodId])
        {
            return food;
        }
    }
    
    return nil;
    
}

@end
