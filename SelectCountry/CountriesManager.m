//
//  CountriesManager.m
//  SelectCountry
//
//  Created by Diego Mazzone on 7/4/15.
//  Copyright (c) 2015 Mundo Mac. All rights reserved.
//

#import "CountriesManager.h"
#import "Synchronizer.h"
#import "AppDelegate.h"

@interface CountriesManager ()

@property (weak, nonatomic) NSManagedObjectContext *context;

@end

@implementation CountriesManager

// Shared instance of CountriesManager
+ (CountriesManager *)sharedInstance
{
    static dispatch_once_t pred = 0;
    static CountriesManager *countriesManager = nil;
    dispatch_once(&pred, ^{
        countriesManager = [[CountriesManager alloc] init];
        AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
        countriesManager.context = appDelegate.managedObjectContext;
    });
    return countriesManager;
}

- (void)updateCountries
{
    
    if ([self.countries count] != 0) {
        
        [[Synchronizer sharedInstance] getCountries:^(NSArray * countries) {
            
            for (NSDictionary *countryInfo in countries) {
                
                Country *country = [NSEntityDescription insertNewObjectForEntityForName:@"Country" inManagedObjectContext:self.context];
                
                country.name = countryInfo[@"name"];
                country.capital = countryInfo[@"capital"];
                country.lat = @([[countryInfo[@"latlng"] firstObject] doubleValue]);
                country.lng = @([[countryInfo[@"latlng"] lastObject] doubleValue]);
            }
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"CountriesUpdated"
                                                                object:self
                                                              userInfo:nil];
        }];
    }
}

- (NSArray *)countries
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Country"];
    
    NSError *error = nil;
    NSArray *matches = [self.context executeFetchRequest:request error:&error];
    
    return matches;
}



@end
