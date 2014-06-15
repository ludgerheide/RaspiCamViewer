//
//  FlipsideViewController.h
//  RaspiCamViewer
//
//  Created by Ludger Heide on 14.06.14.
//  Copyright (c) 2014 LH Technologies. Licensed under the WTFPL.
//

#import <UIKit/UIKit.h>

@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController

@property (weak, nonatomic) id <FlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
