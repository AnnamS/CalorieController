//
//  AddViewFoodController.m
//  Calorie Controller
//
//  Created by Annam Siddique on 18/05/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import "AddViewFoodController.h"

@interface AddViewFoodController ()

@end

@implementation AddViewFoodController

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
    self.availableFood = [self.appDelegate fetchFoodRecords];
    self.lblNewFoodError.hidden = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.availableFood count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"FoodCell";
    
    FoodCell *cell = (FoodCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"FoodCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    Food *current = [self.availableFood objectAtIndex:indexPath.row];
    
    cell.lblName.text = current.name;
    cell.lblCategory.text = current.category;
    cell.lblCalories.text = current.calories;

    return cell;
}

- (IBAction)dismissView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addNewFood:(id)sender
{
    if([self.tbNewFoodName.text isEqualToString:@""] || [self.tbNewFoodName.text isEqualToString:nil] ||
       [self.tbNewFoodCalories.text isEqualToString:@""] || [self.tbNewFoodCalories.text isEqualToString:nil])
    {
        self.lblNewFoodError.text = @"Please Fill In ALL Fields";
        self.lblNewFoodError.hidden = NO;
    }
    else
    {
        BOOL exists = NO;
        for (Food *food in self.availableFood)
        {
            if([food.name isEqualToString:self.tbNewFoodName.text])
            {
                exists = YES;
            }
        }
        
        if(exists == YES)
        {
            self.lblNewFoodError.text = @"Food Already Exists";
            self.lblNewFoodError.hidden = NO;
        }
        else
        {
            self.lblNewFoodError.hidden = YES;
            Food *newFood = (Food *)[NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:self.appDelegate.managedObjectContext];
            
            int foodCount = [self.appDelegate countFoodRecords];
            foodCount++;
            [newFood setId:[NSString stringWithFormat:@"%i",foodCount]];
            [newFood setCategory:[self.categorySelector titleForSegmentAtIndex:self.categorySelector.selectedSegmentIndex]];
            [newFood setName:self.tbNewFoodName.text];
            [newFood setCalories:self.tbNewFoodCalories.text];
            
            NSError *error;
            if(![self.appDelegate.managedObjectContext save:&error])
            {
                NSLog(@"Error");
                //This is a serious error saying the record
                //could not be saved. Advise the user to
                //try again or restart the application.
            }
            
            self.availableFood = [self.appDelegate fetchFoodRecords];
            
            [self.tableView reloadData];
        }
        
        
    }
    
}
@end
