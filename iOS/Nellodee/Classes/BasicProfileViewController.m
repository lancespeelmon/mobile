//
//  BasicProfileViewController.m
//  Nellodee
//
//  Created by Ada Hopper on 27/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BasicProfileViewController.h"
#import "MeService.h"
#import "BasicInfo.h"
#import "NellodeeApp.h"
#import "TagsViewController.h"
#import "RolTableViewController.h"

@implementation BasicProfileViewController

@synthesize tableHeaderView;
@synthesize firstNameTextField, lastNameTextField,prefNameTextField,photoButton;


#define USER 0
#define ROL 1
#define ACADEMIC 2
#define TAGS 3


/*- (id) init{
    self=[super init];

    return self;

}




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)dealloc {
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    BasicInfo * basic = [[NellodeeApp sharedNellodeeData] basicInfo] ;    
    [firstName setText:[basic firstName]];
    [lastName setText:[basic lastName]];
    [prefName setText:[basic prefName]];
    [email setText:[basic email]];
    [rol setText:[basic rol]];
    [departament setText:[basic departament]];
    [college setText:[basic college]];
   
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

*/


#pragma mark -
#pragma mark View lifecycle


- (void)viewWillAppear:(BOOL)animated {
    // Create and set the table header view.
    if (tableHeaderView == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"DetailHeaderView" owner:self options:nil];
        self.tableView.tableHeaderView = tableHeaderView;
        self.tableView.allowsSelectionDuringEditing = YES;
    }
    
    //Get user information
    basic = [[NellodeeApp sharedNellodeeData] basicInfo] ; 
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;

    // Update the view with current data before it is displayed.
    [super viewWillAppear:animated];
    
    // Scroll the table view to the top before it appears  
    [self.tableView setContentOffset:CGPointZero animated:YES];
    self.title = @"Basic Profile";
    
    
    firstNameTextField.text =[basic firstName];
    lastNameTextField.text = [basic lastName];
    prefNameTextField.text = [basic prefName];
    

    [self.tableView reloadData]; 

}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // There are three sections, for rol, college info, and tags, in that order.
    return 4;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSInteger rows = 0;
    switch (section) {
        case USER:
            rows = 2;
            break;
        case ROL:
            rows = 1;
            break;
        case ACADEMIC:
            rows = 2;
            break;
        case TAGS:
            rows = 1;
            break;
        default:
            break;
    }
    return rows;

}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title = nil;
    // Return a title or nil as appropriate for the section.
    switch (section) {
        case USER:
            title = @"User Information";
            break;
        case ROL:
            title = @"Rol";
            break;
        case ACADEMIC:
            title = @"Academic Information";
            break;
        case TAGS:
            title = @"More Information";
            break;    
        default:
            break;
    }
    return title;;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
	static NSString *CellIdentifier = @"CellIdentifier";
    static NSString *UserCellIdentifier = @"UserCellIdentifier";
    static NSString *AcademicCellIdentifier = @"AcademicCellIdentifier";

    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    
    switch (indexPath.section) {
        case USER: 
			
			cell = [tableView dequeueReusableCellWithIdentifier:UserCellIdentifier];
			
			if (cell == nil) {
				cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:UserCellIdentifier] autorelease];
				cell.accessoryType = UITableViewCellAccessoryNone;
			}
            if(indexPath.row ==0){
                cell.textLabel.text = [basic username];
                cell.detailTextLabel.text = @"username";
            }
            else{
                cell.textLabel.text = [basic email];
                cell.detailTextLabel.text = @"email";
            }

            break;    
        case ROL: 
            
            if([basic rol] == nil){
                cell.textLabel.text = @"No rol assigned";
            }
            else{
                cell.textLabel.text =[basic rol];
            }
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.editingAccessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        case ACADEMIC: 
			cell = [tableView dequeueReusableCellWithIdentifier:AcademicCellIdentifier];
			
			if (cell == nil) {
				cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:AcademicCellIdentifier] autorelease];
				cell.accessoryType = UITableViewCellAccessoryNone;
			}
            if(indexPath.row ==0){
                if([basic departament] == nil){
                    cell.textLabel.text = @"No departament assigned";
                }
                else{
                    cell.textLabel.text = [basic departament];
                }
                cell.detailTextLabel.text = @"Department";
            }
            else{
                if([basic college] == nil){
                    cell.textLabel.text = @"No college assigned";
                }
                else{
                    cell.textLabel.text = [basic college];
                }
                cell.detailTextLabel.text = @"College";
            }
            
            break;             
        case TAGS:
            cell.textLabel.text =@"Tags";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.editingAccessoryType = UITableViewCellAccessoryNone;
            break;
        default:
            break;
    }
        return cell;


}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger section = indexPath.section;
    UIViewController *nextViewController = nil;
    
    /*
     What to do on selection depends on what section the row is in.
     For Type, Instructions, and Ingredients, create and push a new view controller of the type appropriate for the next screen.
     */
    switch (section) {
        case USER:
            break;
            
        case ROL:
            nextViewController = [[RolTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
            //((TypeSelectionViewController *)nextViewController).recipe = recipe;
            break;
			
        case TAGS:
            nextViewController = [[TagsViewController alloc] initWithNibName:@"TagsViewController" bundle:nil];
            break;
			
        case ACADEMIC:
            /*nextViewController = [[IngredientDetailViewController alloc] initWithStyle:UITableViewStyleGrouped];
            ((IngredientDetailViewController *)nextViewController).recipe = recipe;
            
            if (indexPath.row < [recipe.ingredients count]) {
                Ingredient *ingredient = [ingredients objectAtIndex:indexPath.row];
                ((IngredientDetailViewController *)nextViewController).ingredient = ingredient;
            }*/
            break;
			
        default:
            break;
    }
    
    // If we got a new view controller, push it .
    if (nextViewController) {
        [self.navigationController pushViewController:nextViewController animated:YES];
        [nextViewController release];
    }
}





@end
