//
//  ShowCountryOnMapVC.m
//  SelectCountry
//
//  Created by Diego Mazzone on 16/4/15.
//  Copyright (c) 2015 Mundo Mac. All rights reserved.
//

#import "ShowCountryOnMapVC.h"
#import <MapKit/MapKit.h>

@interface ShowCountryOnMapVC ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ShowCountryOnMapVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.mapView addAnnotation:self.country];
}

@end
