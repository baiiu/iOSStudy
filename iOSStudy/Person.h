//
//  Person.h
//  iOSStudy
//
//  Created by ByteDance on 2025/3/25.
//

#import <Foundation/Foundation.h>
#import "IBehavior.h"
#import "PersonDelegate.h"
#import "IObserver.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject<IBehavior>

@property (nonatomic, strong) NSString *currentItem;

@property NSString *name;
@property BOOL sex;
@property int age;
@property (nonatomic,weak) id<PersonDelegate> delegate;


-(id)initWithNameAge:(NSString *)name age:(int)age;
-(void)print;
-(void)setNameAge:(NSString*) name age:(int)age;
-(int)compare:(Person*) other;

-(void) sayHello;

// block
typedef void (^simpleBlock)(void);

typedef int (^MethOperatorBlock)(int, int);
@property(atomic, copy, nullable) MethOperatorBlock addition;

typedef NSString* _Nullable (^FetchRequest)(Person* _Nullable, NSString* _Nullable);
@property(atomic, copy, nullable) FetchRequest request;

-(void) configAddOperator:(MethOperatorBlock) block;
-(int) testAddition:(int)a b:(int) b;


// id
-(void) setObserver:(_Nullable id<IObserver>) observer;

@end

NS_ASSUME_NONNULL_END
