//
//  FoodMasterController.m
//  Calorie Controller
//
//  Created by Annam Siddique on 15/05/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import "FoodMasterController.h"

@interface FoodMasterController ()
{
    DatePopOverController *controller;
    UIPopoverController *popoverController;
    UIBarButtonItem *btnAdd;
}
@end

@implementation FoodMasterController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.appDelegate = [[CalculatorAppDelegate alloc]init];
    btnAdd = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButton:)];
         self.navigationItem.rightBarButtonItem = btnAdd;
    
    controller = [[DatePopOverController alloc] initWithNibName:@"DatePopOverController" bundle:nil];
    controller.dateDelegate = self;
    popoverController = [[UIPopoverController alloc] initWithContentViewController:controller];

    self.dates = [[NSMutableArray alloc] init];
    [self updateDateList];
    

    
}


-(void)updateDateList
{
    NSMutableArray *mealRecords = [self.appDelegate fetchMealRecords];
    for(Meal *meal in mealRecords)
    {
        if(![self.dates containsObject:meal.date])
        {
            [self.dates addObject:meal.date];
        }
    }
    
}

-(void)addButton: (id)sender
{
    if ([popoverController isPopoverVisible])
    {
        [popoverController dismissPopoverAnimated:YES];
    }
    else
    {
        // Assign self as the delegate for the child view controller
//        popoverController.delegate = self;
    
        popoverController.popoverContentSize = CGSizeMake(300, 300);
        [popoverController presentPopoverFromRect:CGRectMake(320, 0, 0, 0)
                                           inView:self.view
                         permittedArrowDirections:UIPopoverArrowDirectionLeft
                                         animated:YES];
    }

   
}

- (void)datePopOverController:(DatePopOverController *)datePopOverController didChooseDate:(NSString *)date
{
    NSUInteger exists = [self.dates indexOfObject: date];
    
    if(exists == NSNotFound)
    {
        [self.dates addObject:date];
    }

    [self.tableView reloadData];
    // Do something with value...
    
    // ...then dismiss the child view controller
    [popoverController dismissPopoverAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.dates count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *dateCellIdentifier = @"DateCell";
    
    DateCell *cell = (DateCell *)[tableView dequeueReusableCellWithIdentifier:dateCellIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DateCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.lblDate.text = [self.dates objectAtIndex:indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DateCell *cell = (DateCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    [self.foodDelegate foodMasterController:self didChooseDate:cell.lblDate.text];
}

@end
