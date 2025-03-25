//
//  Person+Location.h
//  iOSStudy
//
//  Created by ByteDance on 2025/3/25.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person ()

@property NSString* location;

-(void)updateLocation:(NSString*) location;
-(NSString*) getLocation;

@end

NS_ASSUME_NONNULL_END
