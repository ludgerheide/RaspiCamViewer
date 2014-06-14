//
//  GStreamerBackend.h
//  RaspiCamViewer
//
//  Created by Ludger Heide on 14.06.14.
//  Copyright (c) 2014 LH Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GSTreamerBackendDelegate
-(void) gstreamerSetUIMessage:(NSString *)message;
-(void) gstreamerInitialized;
@end

@interface GStreamerBackend : NSObject

-(id) init:(id)uiDelegate videoView:(UIView *)video_view;
-(id)init: (id)uiDelegate;
-(NSString*) getGStreamerVersion;
-(void) play;
-(void) pause;

@end
