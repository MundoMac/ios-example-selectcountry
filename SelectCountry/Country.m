//
//  Country.m
//  SelectCountry
//
//  Created by Diego Mazzone on 7/4/15.
//  Copyright (c) 2015 Mundo Mac. All rights reserved.
//

#import "Country.h"

@interface Country ()

@end

@implementation Country

- (CLLocationCoordinate2D)coordinate
{
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = self.lat;
    coordinate.longitude = self.lng;
    
    return coordinate;
}

- (NSString *)title
{
    return self.name;
}

- (NSString *)subtitle
{
    return self.capital;
}

@end
