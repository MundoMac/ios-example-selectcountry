//
//  SelectCountryTVC.m
//  SelectCountry
//
//  Created by Diego Mazzone on 7/4/15.
//  Copyright (c) 2015 Mundo Mac. All rights reserved.
//

#import "SelectCountryTVC.h"
#import "CountriesManager.h"
#import "ShowCapitalVC.h"

@interface SelectCountryTVC ()

@end

@implementation SelectCountryTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[CountriesManager sharedInstance] updateCountries];
    
    [self registerForNotifications];
}

- (void)registerForNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleCountriesUpdateded:)
                                                 name:@"CountriesUpdated"
                                               object:nil];
}

- (void)handleCountriesUpdateded:(NSNotification *)notif
{
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[CountriesManager sharedInstance].countries count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *CellIdentifier = @"CountryCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    Country *country = [CountriesManager sharedInstance].countries[indexPath.row];
    
    cell.textLabel.text = country.name;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowCapital"]) {
        
        if ([segue.destinationViewController isKindOfClass:[ShowCapitalVC class]]) {
            
            ShowCapitalVC *showCapitalVC = (ShowCapitalVC *)segue.destinationViewController;
            
            Country *country = [CountriesManager sharedInstance].countries[[self.tableView indexPathForSelectedRow].row];
            
            showCapitalVC.country = country;
            
        }
    }
}

@end
