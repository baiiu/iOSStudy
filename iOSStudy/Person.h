//
//  Person.h
//  iOSStudy
//
//  Created by ByteDance on 2025/3/25.
//

#import <Foundation/Foundation.h>
#import "IBehavior.h"
#import "PersonDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject<IBehavior>

@property NSString *name;
@property BOOL sex;
@property int age;
@property (nonatomic,weak) id<PersonDelegate> delegate;

-(id)initWithNameAge:(NSString*) name: (int) age;
-(void)print;
-(void)setNameAge:(NSString*) name age:(int)age;
-(int)compare:(Person*) other;

-(void) sayHello;

@end

NS_ASSUME_NONNULL_END
