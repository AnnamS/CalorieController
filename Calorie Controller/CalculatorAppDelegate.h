//
//  CalculatorAppDelegate.h
//  Calorie Controller
//
//  Created by Annam Siddique on 19/03/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

-(void)saveContext;
-(NSURL *)applicationDocumentsDirectory;
@end
