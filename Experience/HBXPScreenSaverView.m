//
//  HBXPScreenSaverView.m
//  Experience
//
//  Created by Adam D on 25/09/2014.
//  Copyright (c) 2014 HASHBANG Productions. All rights reserved.
//

#import "HBXPScreenSaverView.h"

@implementation HBXPScreenSaverView {
	NSImage *_image;
	NSUInteger _iteration;
}

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview {
	self = [super initWithFrame:frame isPreview:isPreview];
	
	if (self) {
		_image = [[NSImage alloc] initWithContentsOfFile:[[NSBundle bundleForClass:self.class] pathForResource:@"logon" ofType:@"png"]];
		
		self.animationTimeInterval = 10.0;
	}
	
	return self;
}

- (void)drawRect:(NSRect)rect {
	[super drawRect:rect];
	
	CGRect imageFrame = (CGRect){ { 50.f, self.frame.size.height - _image.size.height - 50.f }, _image.size };
	
	if (_iteration > 1) {
		imageFrame.origin = SSRandomPointForSizeWithinRect(_image.size, self.frame);
	} else {
		_iteration++;
	}
	
	[_image drawInRect:imageFrame];
}

- (void)animateOneFrame {
	[self setNeedsDisplay:YES];
}

- (BOOL)hasConfigureSheet {
	return NO;
}

@end
