//
//  Person.m
//  iOSStudy
//
//  Created by ByteDance on 2025/3/25.
//

#import "Person.h"

@implementation Person {
    int _age;
    __weak _Nullable id<IObserver> _observer;
}
@dynamic age;  // 告诉编译器我们将手动提供getter和setter方法

- (void)setAge:(int)age{
    NSLog(@"setAge: %d", age);
    if (_observer != nil) {
        [_observer onAgeUpdated:_age oldAge:age];
    }
    _age = age;
}
- (int) age {
    NSLog(@"getAge: %d", _age);
    return _age;
}

-(id)init{
    self = [super init];
    if (self != nil) {
        self.name = @"none";
        self.age = -1;
    }
    
    return self;
}

-(id)initWithNameAge:(NSString*) name age:(int)age{
    self = [super init];
    if (self != nil) {
        self.name = name;
        self.age = age;
    }
    return self;
}

-(void) print {
    NSLog(@"Person: %@, %d", self.name, self.age);
}

-(void)setNameAge:(NSString*) name age:(int)age{
    self.name = name;
    if (_observer != nil) {
        [_observer onAgeUpdated:self.age oldAge:age];
    }
    self.age = age;
}

-(int)compare:(Person*) other{
    return self.age > other.age;
}

-(void) sayHello{
    NSLog(@"%@ sayHello", self.name);
    
    if ([self.delegate respondsToSelector:@selector(personDidSayHello)]) {
        [self.delegate personDidSayHello];
    }
    
}

-(NSString*) description{
    return [NSString stringWithFormat:@"Person: %@, %d, %d", self.name, self.age, self.sex];
}

-(void) dealloc{
    NSLog(@"dealloc");
}

// come from Protocol
-(void) eat{
    NSLog(@"eat");
}

-(void) drink{
    NSLog(@"drink");
}
-(void) sleep{
    NSLog(@"sleep");
}


-(void) configAddOperator:(MethOperatorBlock) block{
    self.addition = block;
}
-(int) testAddition:(int) a: (int) b{
    if (self.addition == nil) {
        return -1;
    }
    return self.addition(a, b);
}



-(void) setObserver:(_Nullable id<IObserver>) observer{
    _observer = observer;
}

@end
