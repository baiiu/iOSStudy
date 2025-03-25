//
//  Location.m
//  iOSStudy
//
//  Created by ByteDance on 2025/3/25.
//

#import "Person+Location.h"

@implementation Person(Location)

// come from Extension
-(void)updateLocation:(NSString*) location{
    self.location = location;
}

-(NSString*) getLocation{
    return self.location;
}

@end
