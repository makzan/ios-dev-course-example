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
@property (nonatomic, retain) NSMutableArray *dataArray;
@end

@implementation ViewController
@synthesize tableView = _tableView;
@synthesize dataArray = _dataArray;

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
    
    
//    self.navigationItem.title = @"Home Screen";
    
    // Configure the navigation bar background color
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    // setup the top right button    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"About" style:UIBarButtonItemStyleBordered target:self action:@selector(tappedAbout)];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // we need to call this every time when the view shows.
    self.navigationController.navigationBarHidden = NO;
    
    // reload the table view every time we back from navigation controller
    [self.tableView reloadData];
}

- (void)viewDidUnload
{
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
    
    // reset the detail text first.
    cell.detailTextLabel.text = @"";
    
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"選擇地點";
            cell.detailTextLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"SelectedPlace"];
        }
        else if (indexPath.row == 1)
        {
            cell.textLabel.text = @"Cell 2";
        }
        else if (indexPath.row == 2)
        {
            cell.textLabel.text = @"Back to Home";
        }
        
    }
    else if (indexPath.section == 1)
    {
        cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
        
        UISwitch *switchView = [[UISwitch alloc] init];
        [switchView addTarget:self action:@selector(switchViewToggled:) forControlEvents:UIControlEventValueChanged];
        switchView.tag = indexPath.row;
        cell.accessoryView = switchView;
        
        [switchView release];
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
    
    if (indexPath.section == 0 && indexPath.row == 0)
    {
        // Contsruct another view controller here.
        Step1ViewController *viewController = [[[Step1ViewController alloc] init] autorelease];
        [self.navigationController pushViewController:viewController animated:YES];
    }
    else if (indexPath.section == 0 && indexPath.row == 2)
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
    
}



#pragma mark - Bar Buttons Actions

- (void)tappedAbout {
    AboutViewController *aboutViewController = [[[AboutViewController alloc] init] autorelease];
    
    // show the about as modal view
    [self presentModalViewController:aboutViewController animated:YES];
}




 - (void)dealloc {
     [_tableView release];
     [super dealloc];
 }
@end
