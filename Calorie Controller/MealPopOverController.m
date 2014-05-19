//
//  MealPopOverController.m
//  Calorie Controller
//
//  Created by Annam Siddique on 19/05/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import "MealPopOverController.h"

@interface MealPopOverController ()

@end

@implementation MealPopOverController

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
    
    self.appDelegate = [[CalculatorAppDelegate alloc]init];
    self.foodNameFromCategory = [[NSMutableArray alloc] init];
    self.foodCategories = [[NSMutableArray alloc] init];
    
    [self updateFoodNameList:@"Breakfast"];
    self.pickerMealName.hidden = YES;
    self.btnDoneMealName.hidden = YES;
    
    self.lblNewMealError.hidden = YES;
    [self.mealCategory addTarget:self action:@selector(segmentValueChanged) forControlEvents:UIControlEventValueChanged];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)segmentValueChanged
{
    NSString *category = [self.mealCategory titleForSegmentAtIndex:self.mealCategory.selectedSegmentIndex];
    [self updateFoodNameList:category];
}

-(void)updateFoodNameList: (NSString *) category
{
    [self.foodNameFromCategory removeAllObjects];
    NSMutableArray *foodRecords = [self.appDelegate fetchFoodRecords];
    
    for (Food *food in foodRecords)
    {
        if([food.category isEqualToString:category])
        {
            [self.foodNameFromCategory addObject:food.name];
        }
    }
    
    self.lblMealName.text = [self.foodNameFromCategory objectAtIndex:0];
    
    [self.pickerMealName reloadAllComponents];
}

- (IBAction)changeMealName:(id)sender
{
    self.pickerMealName.hidden = NO;
    
    self.btnDoneMealName.hidden = NO;
    self.btnChangeMealName.hidden = YES;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component
{
    
}

// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.foodNameFromCategory count];
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.foodNameFromCategory objectAtIndex:row];
}

- (IBAction)doneSelectingName:(id)sender
{
    self.btnDoneMealName.hidden = YES;
    self.btnChangeMealName.hidden = NO;
    self.pickerMealName.hidden = YES;
    NSInteger row = [self.pickerMealName selectedRowInComponent:0];
    self.lblMealName.text = [self.foodNameFromCategory objectAtIndex:row];
}

- (IBAction)saveNewMeal:(id)sender
{
    if([self.tbMealWeight.text isEqualToString:@""] ||[self.tbMealWeight.text isEqualToString:nil])
    {
        self.lblNewMealError.hidden = NO;
    }
    else
    {
        self.lblNewMealError.hidden = YES;
        
        Meal *meal = (Meal *)[NSEntityDescription insertNewObjectForEntityForName:@"Meal" inManagedObjectContext:self.appDelegate.managedObjectContext];
        
        [meal setFoodID:[self getFoodId:self.lblMealName.text]];
        [meal setDate:self.date];
        [meal setWeight:self.tbMealWeight.text];
        
        NSError *error;
        
        if(![self.appDelegate.managedObjectContext save:&error])
        {
            NSLog(@"Error");
            //This is a serious error saying the record
            //could not be saved. Advise the user to
            //try again or restart the application.
        }
        else
        {
            [self.mealDelegate didAddMeal:self];
        }
    }
}

-(NSString *)getFoodId:(NSString *)foodName
{
    NSString *foodId = 0;
    NSMutableArray *foodRecords = [self.appDelegate fetchFoodRecords];
    for(Food *food in foodRecords)
    {
        if([food.name isEqualToString:foodName])
        {
            foodId = food.id;
        }
    }
    
    return foodId;
}

- (IBAction)cancel:(id)sender
{
    [self.mealDelegate didAddMeal:self];
}
@end
