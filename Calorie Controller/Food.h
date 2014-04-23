//
//  FoodCategory.h
//  Calorie Controller
//
//  Created by Hasnat Hoque on 26/03/2014.
//  Copyright (c) 2014 Annam Siddique. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Food : NSObject

@property (nonatomic,strong) NSString *id;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *calories;
@property (nonatomic,strong) NSString *category;
@end
