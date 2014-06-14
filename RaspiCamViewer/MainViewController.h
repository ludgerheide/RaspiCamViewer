//
//  MainViewController.h
//  RaspiCamViewer
//
//  Created by Ludger Heide on 14.06.14.
//  Copyright (c) 2014 LH Technologies. All rights reserved.
//

#import "FlipsideViewController.h"
#import "GStreamerBackend.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIPopoverControllerDelegate, GSTreamerBackendDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;

@end
