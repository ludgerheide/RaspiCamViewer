//
//  GStreamerBackend.m
//  RaspiCamViewer
//
//  Created by Ludger Heide on 14.06.14.
//  Copyright (c) 2014 LH Technologies. All rights reserved.
//

#import "GStreamerBackend.h"

#include <gst/gst.h>

@implementation GStreamerBackend

-(NSString*) getGStreamerVersion {
    char *version_utf8 = gst_version_string();
    NSString *version_string = [NSString stringWithUTF8String:version_utf8];
    g_free(version_utf8);
    return version_string;
}

@end