//
//  PersonDelegate.h
//  iOSStudy
//
//  Created by ByteDance on 2025/3/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PersonDelegate <NSObject>

@optional
-(void)personDidSayHello;

@end

NS_ASSUME_NONNULL_END
