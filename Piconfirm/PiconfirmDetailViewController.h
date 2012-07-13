//
//  PiconfirmDetailViewController.h
//  Piconfirm
//
//  Created by Hilario Perez Corona on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HttpAsincrono.h"

@interface PiconfirmDetailViewController : UIViewController <UISplitViewControllerDelegate> {
  
  HttpAsincrono *http;
  
}

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (strong, nonatomic) IBOutlet UITextField *guiaField;
@property (strong, nonatomic) IBOutlet UITextField *tripField;
@property (strong, nonatomic) IBOutlet UITextField *fechaField;
@property (strong, nonatomic) IBOutlet UITextField *observacionesField;
@property (strong, nonatomic) IBOutlet UITextView *texto;

@property (strong, nonatomic) IBOutlet UITextField *nombreField;
@property (strong, nonatomic) IBOutlet UITextField *edadField;

- (IBAction)alta;
- (IBAction)peticion;

@end
