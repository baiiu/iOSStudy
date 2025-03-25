//
//  Person.m
//  iOSStudy
//
//  Created by ByteDance on 2025/3/25.
//

#import "Person.h"

@implementation Person

-(id)init{
    self = [super init];
    if (self != nil) {
        self.name = @"none";
        self.age = -1;
    }
    
    return self;
}

-(id)initWithNameAge:(NSString*) name: (int)age{
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
    self.age = age;
}

-(int)compare:(Person*) other{
    return self.age > other.age;
}

-(NSString*) description{
    return [NSString stringWithFormat:@"Person: %@, %d", self.name, self.age];
}

-(void) dealloc{
    NSLog(@"dealloc");
}



@end
