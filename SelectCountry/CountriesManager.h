//
//  CountriesManager.h
//  SelectCountry
//
//  Created by Diego Mazzone on 7/4/15.
//  Copyright (c) 2015 Mundo Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Country.h"

@interface CountriesManager : NSObject

@property (strong, nonatomic) NSArray *countries; // of Country

+ (CountriesManager *)sharedInstance;

- (void)updateCountries;

@end
