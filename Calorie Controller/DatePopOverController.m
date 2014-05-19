//
//  DatePopOverController.m
//  Calorie Controller
//
//  Created by Annam Siddique on 15/05/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import "DatePopOverController.h"

@interface DatePopOverController ()

@end

@implementation DatePopOverController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneDate:(id)sender
{
    NSDateFormatter* df = [[NSDateFormatter alloc]init];
    df.dateFormat = @"dd/MM/yyyy";
    NSString* dateString = [df stringFromDate:self.datePicker.date];
    
    [self.dateDelegate datePopOverController:self didChooseDate:[NSString stringWithFormat:@"%@",dateString]];
 
}
@end
