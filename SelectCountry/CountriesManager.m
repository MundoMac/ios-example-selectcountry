//
//  CountriesManager.m
//  SelectCountry
//
//  Created by Diego Mazzone on 7/4/15.
//  Copyright (c) 2015 Mundo Mac. All rights reserved.
//

#import "CountriesManager.h"
#import "Synchronizer.h"

@implementation CountriesManager

// Shared instance of CountriesManager
+ (CountriesManager *)sharedInstance
{
    static dispatch_once_t pred = 0;
    static CountriesManager *countriesManager = nil;
    dispatch_once(&pred, ^{
        countriesManager = [[CountriesManager alloc] init];
    });
    return countriesManager;
}

- (void)updateCountries
{
    [[Synchronizer sharedInstance] getCountries:^(NSArray * countries) {
        
        NSMutableArray *countriesMutable = [@[] mutableCopy];
        
        for (NSDictionary *countryInfo in countries) {
            Country *country = [Country new];
            country.name = countryInfo[@"name"];
            country.capital = countryInfo[@"capital"];
            country.lat = [[countryInfo[@"latlng"] firstObject] doubleValue];
            country.lng = [[countryInfo[@"latlng"] lastObject] doubleValue];
            
            [countriesMutable addObject:country];
        }
        
        self.countries = [countriesMutable copy];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"CountriesUpdated"
                                                            object:self
                                                          userInfo:nil];
    }];
}



@end
