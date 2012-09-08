//
//  ViewController.m
//  TableViewDemo
//
//  Created by Freshman on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "Step1ViewController.h"
#import "AboutViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *switchStatuses;
@end

@implementation ViewController
@synthesize tableView = _tableView;
@synthesize dataArray = _dataArray;
@synthesize switchStatuses = _switchStatuses;

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.dataArray = [[NSMutableArray alloc] initWithCapacity:10];
    [self.dataArray addObject:@"Record 1"];
    [self.dataArray addObject:@"Record 2"];
    [self.dataArray addObject:@"Record 3"];
    [self.dataArray addObject:@"Record 4"];
    [self.dataArray addObject:@"Record 5"];
    [self.dataArray addObject:@"Record 6"];
    [self.dataArray addObject:@"Record 7"];
    [self.dataArray addObject:@"Record 8"];
    [self.dataArray addObject:@"Record 9"];
    [self.dataArray addObject:@"Record 10"];
    
    self.switchStatuses = [[NSMutableArray alloc] initWithCapacity:10];
    for (int i=0;i<10;i++)
    {
        [self.switchStatuses addObject:@(NO)];
    }
    
    
    self.navigationItem.title = @"Home";
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"About"
                                                              style:UIBarButtonItemStyleBordered
                                                             target:self
                                                             action:@selector(tappedAbout)];
    
    self.navigationItem.rightBarButtonItem = item1;

}

- (void)tappedAbout
{
    NSLog(@"You tapped about.");
    AboutViewController *aboutVC = [[AboutViewController alloc] init];
    
    UINavigationController *aboutNavController = [[UINavigationController alloc] initWithRootViewController:aboutVC];
    
    [self presentModalViewController:aboutNavController animated:YES];
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(dismissAboutView) userInfo:nil repeats:NO];
}

- (void)dismissAboutView
{
//    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 3;
    }
    else if (section == 1)
    {
        return [self.dataArray count];
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"NormalCell";
    
    if (indexPath.section == 1)
    {
        identifier = @"SwitchCell";
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.detailTextLabel.text = @"";
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"您的住所";
            
            NSString *place = [[NSUserDefaults standardUserDefaults] objectForKey:@"SelectedPlace"];
            if (place == nil) place = @"未選擇";
            
            cell.detailTextLabel.text = place;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        else if (indexPath.row == 1)
        {
            cell.textLabel.text = @"Cell 2";
        }
        else if (indexPath.row == 2)
        {
            cell.textLabel.text = @"Cell 3";
        }
        
    }
    else if (indexPath.section == 1)
    {
        cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
        
        UISwitch *switchView = [[UISwitch alloc] init];
        [switchView addTarget:self action:@selector(switchViewToggled:) forControlEvents:UIControlEventValueChanged];
        switchView.tag = indexPath.row;
        
        cell.accessoryView = switchView;
        
        switchView.on = [[self.switchStatuses objectAtIndex:indexPath.row] boolValue];
        
    }
    
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"Section 1";
    }
    else if (section == 1)
    {
        return @"Section 2";
    }
    
    return @"";
}


#pragma mark - Table View Delegates

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // experiement only.
    if (indexPath.row == 0)
    {
        UIViewController *nextViewController = [[Step1ViewController alloc] init];
        [self.navigationController pushViewController:nextViewController animated:YES];
    }
    else if (indexPath.row == 1)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (indexPath.row == 2)
    {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}


#pragma mark - Switch View Actions
- (void)switchViewToggled:(UISwitch*)switchView
{
    if (switchView.on)
    {
        NSLog(@"switch %d is toggled to ON", switchView.tag);
    }
    else {
        NSLog(@"switch %d is toggled to OFF", switchView.tag);
    }
    
    [self.switchStatuses replaceObjectAtIndex:switchView.tag withObject:@(switchView.on)];
    
}







@end
