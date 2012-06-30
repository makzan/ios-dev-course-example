//
//  ViewController.m
//  TableEditDemo
//
//  Created by Freshman on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, retain) NSMutableArray *dataArray;
@end

@implementation ViewController
@synthesize tableView;
@synthesize dataArray = _dataArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // our data model
    self.dataArray = [[NSMutableArray alloc] initWithObjects:@"Data 1", @"Data 2", @"Data 3", @"Data 4", @"Data 5", @"Data 6", @"Data 7", nil];
    
    
    //
    UIBarButtonItem *editButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(tappedEdit)] autorelease];
    
    self.navigationItem.rightBarButtonItem = editButton;
    
}

- (void)tappedEdit
{
    if (self.tableView.isEditing)
    {
        [self.tableView setEditing:NO animated:YES];
        
        // update the top right button
        UIBarButtonItem *editButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit 
                                                                                     target:self 
                                                                                     action:@selector(tappedEdit)] autorelease];
        
        self.navigationItem.rightBarButtonItem = editButton;
    }
    else 
    {
        [self.tableView setEditing:YES animated:YES];
        
        
        // update the top right button
        UIBarButtonItem *doneButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone 
                                                                                     target:self 
                                                                                     action:@selector(tappedEdit)] autorelease];
        
        self.navigationItem.rightBarButtonItem = doneButton;
    }

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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Identifier"];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Identifier"] autorelease];
    }
    
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    
    return cell;
}


- (void)dealloc {
    [tableView release];
    [super dealloc];
}


- (void)tableView:(UITableView *)tableView 
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.dataArray removeObjectAtIndex:indexPath.row];
    
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                     withRowAnimation:UITableViewRowAnimationTop];
}


// disable the swipe to delete function, if you need to get rid of it.
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView 
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.isEditing)
    {
        return UITableViewCellEditingStyleDelete;
    }
    
    return UITableViewCellEditingStyleNone;
}


// allow arranging the cell order
- (void)tableView:(UITableView *)tableView 
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath 
      toIndexPath:(NSIndexPath *)destinationIndexPath
{
    // cache the cell content before removing it from the data array.
    id cellContent = [self.dataArray objectAtIndex:sourceIndexPath.row];
    
    // remove the cell content in the data array.
    [self.dataArray removeObjectAtIndex:sourceIndexPath.row];
    
    // re-insert the cell content into the new position in the array.å
    [self.dataArray insertObject:cellContent atIndex:destinationIndexPath.row];
    
    NSLog(@"%@", self.dataArray);
}









@end
