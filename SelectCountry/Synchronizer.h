//
//  Synchronizer.h
//  SelectCountry
//
//  Created by Diego Mazzone on 7/4/15.
//  Copyright (c) 2015 Mundo Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h> 

@interface Synchronizer : NSObject

+ (Synchronizer *)sharedInstance;

- (void)getCountries:(void(^)(NSArray *))success;

@end
