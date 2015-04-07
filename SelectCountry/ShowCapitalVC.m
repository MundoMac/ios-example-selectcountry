//
//  ShowCapitalVC.m
//  SelectCountry
//
//  Created by Diego Mazzone on 7/4/15.
//  Copyright (c) 2015 Mundo Mac. All rights reserved.
//

#import "ShowCapitalVC.h"

@interface ShowCapitalVC ()
@property (weak, nonatomic) IBOutlet UILabel *capitalLabel;

@end

@implementation ShowCapitalVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
   
    self.capitalLabel.text = self.country.capital;
    
    [self.navigationItem setTitle:self.country.name];
}

@end
