//
//  ViewController.m
//  SelectionDemo
//
//  Created by Freshman on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    int chosenIndex;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NormalCell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"NormalCell"];
    }
    
    // reset the check mark first
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    // and show the mark if this cell is the one we want.
    if (chosenIndex == indexPath.row)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }

    
    if (indexPath.row == 0)
    {
        cell.textLabel.text = @"Red";        
    }
    else if (indexPath.row == 1)
    {
        cell.textLabel.text = @"Orange";
    }
    else if (indexPath.row == 2)
    {
        cell.textLabel.text = @"Green";
    }
    else if (indexPath.row == 3)
    {
        cell.textLabel.text = @"Blue";
    }
    
    
    
    return cell;
}


#pragma mark - Table View Delegates

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    chosenIndex = indexPath.row;
    
    [tableView reloadData];
}

@end
