//
//  Person.h
//  iOSStudy
//
//  Created by ByteDance on 2025/3/25.
//

#import <Foundation/Foundation.h>
#import "IBehavior.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject<IBehavior>

@property NSString *name;
@property BOOL sex;
@property int age;

-(id)initWithNameAge:(NSString*) name: (int) age;
-(void)print;
-(void)setNameAge:(NSString*) name age:(int)age;
-(int)compare:(Person*) other;


@end

NS_ASSUME_NONNULL_END
