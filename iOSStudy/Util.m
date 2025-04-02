//
//  Util.m
//  iOSStudy
//
//  Created by ByteDance on 2025/4/2.
//

#import "Util.h"
#import <objc/runtime.h>

@implementation Util

+(void) swizzleForClass:(Class) cls oriSEL: (SEL) originSelector newSEL:(SEL)swizzleSelector {
    if (cls == nil || originSelector == nil || swizzleSelector == nil) {
        return;
    }
    
    Method originMethod = class_getInstanceMethod(cls, originSelector);
    Method swizzleMethod = class_getInstanceMethod(cls, swizzleSelector);

    BOOL didAddMethod = class_addMethod(cls, swizzleSelector, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    
    if (didAddMethod) {
        class_replaceMethod(cls,
                originSelector,
                method_getImplementation(originMethod),
                method_getTypeEncoding(originMethod));
        
    } else {
        method_exchangeImplementations(originMethod, swizzleMethod);
    }

}

@end
