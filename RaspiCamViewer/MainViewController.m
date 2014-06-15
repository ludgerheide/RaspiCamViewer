//
//  MainViewController.m
//  RaspiCamViewer
//
//  Created by Ludger Heide on 14.06.14.
//  Copyright (c) 2014 LH Technologies. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController(){
    GStreamerBackend *gst_backend;
    int media_width;
    int media_height;
}

@end

@implementation MainViewController

@synthesize messageLabel, pauseButton, playButton, videoContainerView, videoView, videoHeightConstraint, videoWidthConstraint;

- (void)viewDidLoad
{
    [super viewDidLoad];
    playButton.enabled = false;
    pauseButton.enabled = false;
  
    /* Make these constant for now, later tutorials will change them */
    media_width = 16;
    media_height = 9;
    
    gst_backend = [[GStreamerBackend alloc] init:self videoView: videoView];
}

- (IBAction)playButtonPressed:(id)sender {
    [gst_backend play];
}

- (IBAction)pauseButtonPressed:(id)sender {
    [gst_backend pause];
}

- (void)viewDidLayoutSubviews
{
    CGFloat view_width = videoContainerView.bounds.size.width;
    CGFloat view_height = videoContainerView.bounds.size.height;
    
    CGFloat correct_height = view_width * media_height / media_width;
    CGFloat correct_width = view_height * media_width / media_height;
    
    if (correct_height < view_height) {
        videoHeightConstraint.constant = correct_height;
        videoWidthConstraint.constant = view_width;
    } else {
        videoWidthConstraint.constant = correct_width;
        videoHeightConstraint.constant = view_height;
    }
}

/*
 * Methods from GstreamerBackendDelegate
 */

-(void) gstreamerInitialized {
    dispatch_async(dispatch_get_main_queue(), ^{
        playButton.enabled = TRUE;
        pauseButton.enabled = TRUE;
        messageLabel.text = @"Ready";
    });
}

-(void) gstreamerSetUIMessage:(NSString *)message {
    dispatch_async(dispatch_get_main_queue(), ^{
        messageLabel.text = message;
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
    }
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.flipsidePopoverController = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            UIPopoverController *popoverController = [(UIStoryboardPopoverSegue *)segue popoverController];
            self.flipsidePopoverController = popoverController;
            popoverController.delegate = self;
        }
    }
}

- (IBAction)togglePopover:(id)sender
{
    if (self.flipsidePopoverController) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    } else {
        [self performSegueWithIdentifier:@"showAlternate" sender:sender];
    }
}

@end
