//
//  Country.h
//  SelectCountry
//
//  Created by Diego Mazzone on 21/4/15.
//  Copyright (c) 2015 Mundo Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Country : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * capital;
@property (nonatomic, retain) NSNumber * lat;
@property (nonatomic, retain) NSNumber * lng;

@end
