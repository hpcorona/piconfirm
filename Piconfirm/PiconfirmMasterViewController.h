//
//  PiconfirmMasterViewController.h
//  Piconfirm
//
//  Created by Hilario Perez Corona on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PiconfirmDetailViewController;

@interface PiconfirmMasterViewController : UITableViewController

@property (strong, nonatomic) PiconfirmDetailViewController *detailViewController;
@property (strong, nonatomic) IBOutlet UITableView *tabla;

@end
