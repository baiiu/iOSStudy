//
//  IObserver.h
//  iOSStudy
//
//  Created by ByteDance on 2025/3/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol IObserver <NSObject>

-(void)onAgeUpdated:(int)newAge oldAge:(int) oldAge;

@end

NS_ASSUME_NONNULL_END
