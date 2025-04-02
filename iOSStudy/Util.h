//
//  Util.h
//  iOSStudy
//
//  Created by ByteDance on 2025/4/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Util : NSObject

#define DoMethodSwizzling(cls, ori_sel, new_sel) [Util swizzleForClass:cls oriSEL:ori_sel newSEL:new_sel];

// 替换同类的方法
+(void) swizzleForClass:(Class) cls oriSEL: (SEL) originSelector newSEL:(SEL)swizzleSelector;

@end

NS_ASSUME_NONNULL_END
