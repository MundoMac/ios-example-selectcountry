//
//  Synchronizer.m
//  SelectCountry
//
//  Created by Diego Mazzone on 7/4/15.
//  Copyright (c) 2015 Mundo Mac. All rights reserved.
//

#import "Synchronizer.h"

@implementation Synchronizer

// Shared instance of Synchronizer
+ (Synchronizer *)sharedInstance
{
    static dispatch_once_t pred = 0;
    static Synchronizer *synchronizer = nil;
    dispatch_once(&pred, ^{
        synchronizer = [[Synchronizer alloc] init];
    });
    return synchronizer;
}

- (void)getCountries:(void(^)(NSArray *))success
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSDictionary *parameters = @{};
    
    [manager GET:@"https://restcountries.eu/rest/v1/all" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        success(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@", error);
        
    }];
    
}

@end
