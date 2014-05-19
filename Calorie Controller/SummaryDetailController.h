//
//  SummaryDetailController.h
//  Calorie Controller
//
//  Created by Annam Siddique on 17/05/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SummaryDetailController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblSummary;
@property (weak, nonatomic) IBOutlet UILabel *lblGraphView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *graphView;

@end
