//
//  Country+MKAnnotation.m
//  SelectCountry
//
//  Created by Diego Mazzone on 21/4/15.
//  Copyright (c) 2015 Mundo Mac. All rights reserved.
//

#import "Country+MKAnnotation.h"

@implementation Country (MKAnnotation)

- (CLLocationCoordinate2D)coordinate
{
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = [self.lat doubleValue];
    coordinate.longitude = [self.lng doubleValue];
    
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
