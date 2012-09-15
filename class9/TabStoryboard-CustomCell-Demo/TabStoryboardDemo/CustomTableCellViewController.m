//
//  CustomTableCellViewController.m
//  TabStoryboardDemo
//
//  Created by Makzan on 14/9/12.
//  Copyright (c) 2012 42games Limited. All rights reserved.
//

#import "CustomTableCellViewController.h"
#import "PhotoRecord.h"

#define CellImageTag    1001
#define CellLabelTag    1002

@interface CustomTableCellViewController ()
@property (nonatomic, strong) NSArray *dataArray;

@end

static NSString *CellIdentifier = @"CustomCell";

@implementation CustomTableCellViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // prepare the data
    PhotoRecord *record1 = [[PhotoRecord alloc] init];
    record1.fileName = @"photo1.png";
    record1.title = @"Great Photo 1";
    
    PhotoRecord *record2 = [[PhotoRecord alloc] init];
    record2.fileName = @"photo2.png";
    record2.title = @"Great Photo 2";
    
    PhotoRecord *record3 = [[PhotoRecord alloc] init];
    record3.fileName = @"photo3.png";
    record3.title = @"Great Photo 3";
    
    PhotoRecord *record4 = [[PhotoRecord alloc] init];
    record4.fileName = @"photo4.png";
    record4.title = @"Great Photo 4";
    
    self.dataArray = @[record1, record2, record3, record4];
    
    // register the custom cell
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:CellIdentifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    PhotoRecord *photoRecord = [self.dataArray objectAtIndex:indexPath.row];
    
    UIImageView *imgView = (UIImageView*)[cell viewWithTag:CellImageTag];
    imgView.image = [UIImage imageNamed:photoRecord.fileName];
    
    UILabel *titleLabel = (UILabel*)[cell viewWithTag:CellLabelTag];
    titleLabel.text = photoRecord.title;
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 219.0f;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
