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
#import <SVPullToRefresh/SVPullToRefresh.h>

@interface SelectCountryTVC () <UIActionSheetDelegate>

@end

@implementation SelectCountryTVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self registerForNotifications];
    
    [self.tableView addPullToRefreshWithActionHandler:^{
        [[CountriesManager sharedInstance] updateCountries];
    }];
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
    [self.tableView.pullToRefreshView stopAnimating];
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

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancelar"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Mostrar capital", @"Ver en mapa", nil];
    [actionSheet showInView:self.tableView];
}

#pragma mark - Action Sheet Delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Mostrar capital"]) {
        
        [self performSegueWithIdentifier:@"ShowCapital" sender:nil];
        
    }
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
