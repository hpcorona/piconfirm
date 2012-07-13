//
//  PiconfirmDetailViewController.m
//  Piconfirm
//
//  Created by Hilario Perez Corona on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PiconfirmDetailViewController.h"
#import "Reporte.h"

@interface PiconfirmDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation PiconfirmDetailViewController

@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize masterPopoverController = _masterPopoverController;

@synthesize guiaField,tripField,fechaField,observacionesField,texto;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

  if (self.detailItem) {
      self.detailDescriptionLabel.text = [self.detailItem description];
  }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  [self configureView];
  
  http = [[HttpAsincrono alloc] initWithView:self.view withCenter:texto];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
  self.detailDescriptionLabel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return YES;
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

- (IBAction)alta {
  Reporte *rep = [[Reporte alloc] init];
  rep.guia = guiaField.text;
  rep.trip = tripField.text;
  rep.fecha = fechaField.text;
  rep.observaciones = observacionesField.text;
  [rep alta];
}

- (IBAction)peticion {
  NSString* pet = @"http://10.211.55.3";
  //NSString* pet = @"http://www.google.com";
  [http peticion:pet notificar:self siTodoBien:@selector(respuesta:) error:@selector(error:)];
  texto.text = @"";
  
  NSString* test = @"%@ \"=?&hola";
  NSLog(@"%@",[test URLEncoded]);
}

- (void)respuesta:(NSData*)datos {
  texto.text = [datos ASCIIString];
  
  NSDictionary *dict = [datos JSONValue];
  
  NSLog(@"Valor: %@",[dict objectForKey:@"status"]);
  
}

- (void)error:(NSError*)error {
  texto.text = error.domain;
}

@end
