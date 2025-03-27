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

// block

typedef void (^simpleBlock)(void);

typedef int (^MethOperatorBlock)(int, int);
@property(atomic, copy, nullable) MethOperatorBlock addition;

typedef NSString* (^FetchRequest)(Person*, NSString*);
@property(atomic, copy, nullable) FetchRequest request;

-(void) configAddOperator:(MethOperatorBlock) block;
-(int) testAddition:(int) a: (int) b;

@end

NS_ASSUME_NONNULL_END
