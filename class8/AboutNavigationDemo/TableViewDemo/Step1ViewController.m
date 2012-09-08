//
//  Step1ViewController.m
//  TableViewDemo
//
//  Created by Makzan on 8/9/12.
//
//

#import "Step1ViewController.h"

@interface Step1ViewController ()
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation Step1ViewController
@synthesize dataArray = _dataArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.dataArray = @[@"澳門", @"氹仔", @"路環"];
    
    self.navigationItem.title = @"選擇您的位置";
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"About"
                                                              style:UIBarButtonItemStyleBordered
                                                             target:self
                                                             action:@selector(tappedAbout)];
    
    self.navigationItem.rightBarButtonItem = item1;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Table Delegates
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *MyIdentifier = @"MyIdentifier";
    
	UITableViewCell *cell;
	
	cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:MyIdentifier];
	}
    
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
	
	
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return @"";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
    NSString *choice = [self.dataArray objectAtIndex:indexPath.row];
    NSLog(@"You Selected : %@", choice);

    [[NSUserDefaults standardUserDefaults] setValue:choice forKey:@"SelectedPlace"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}






















@end
