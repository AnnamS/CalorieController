//
//  DatePopOverController.h
//  Calorie Controller
//
//  Created by Annam Siddique on 15/05/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DatePopOverControllerDelegate;

@interface DatePopOverController : UIViewController

@property (nonatomic, weak) id<DatePopOverControllerDelegate> dateDelegate;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@protocol DatePopOverControllerDelegate <NSObject>

- (void)datePopOverController:(DatePopOverController*)datePopOverController
             didChooseDate:(NSString *)date;

@end