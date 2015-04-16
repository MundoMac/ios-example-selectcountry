//
//  Country.h
//  SelectCountry
//
//  Created by Diego Mazzone on 7/4/15.
//  Copyright (c) 2015 Mundo Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Country : NSObject <MKAnnotation>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *capital;
@property (nonatomic) double lat;
@property (nonatomic) double lng;

@end
