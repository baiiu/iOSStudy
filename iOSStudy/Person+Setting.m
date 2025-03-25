//
//  Person+Setting.m
//  iOSStudy
//
//  Created by ByteDance on 2025/3/25.
//

#import "Person+Setting.h"

@implementation Person (Setting)

-(void)updateAge:(int) age {
    self.age = age;
}

-(void)resetSex:(BOOL)sex{
    self.sex = sex;
}


@end
