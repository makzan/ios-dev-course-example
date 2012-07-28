//
//  ViewController.m
//  TableViewDemo
//
//  Created by Freshman on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, retain) NSMutableArray *dataArray;
@end

@implementation ViewController
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NormalCell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"NormalCell"];
    }
    
        
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"Cell 1";
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
    }
    
    cell.detailTextLabel.text = @"Detail Text Label";
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
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
}










@end