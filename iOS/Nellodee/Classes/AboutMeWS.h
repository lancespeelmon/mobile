//
//  AboutMeWS.h
//  Nellodee
//
//  Created by Ada Hopper on 21/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SBJsonStreamParser;
@class SBJsonStreamParserAdapter;
@class About;

@interface AboutMeWS : NSObject {
	NSMutableData *responseData;
	About *aboutMe;

}
- (BOOL) meService;

@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) About * aboutMe;


@end
