//
//  EaglUIView.m
//  RaspiCamViewer
//
//  Created by Ludger Heide on 14.06.14.
//  Copyright (c) 2014 LH Technologies. All rights reserved.
//

#import "EaglUIView.h"
#import <QuartzCore/QuartzCore.h>

@implementation EaglUIView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

+ (Class) layerClass
{
    return [CAEAGLLayer class];
}

@end
