//
//  ViewController.h
//  iOSStudy
//
//  Created by ByteDance on 2025/3/25.
//

#import <UIKit/UIKit.h>
#import "PersonDelegate.h"
#import "IObserver.h"

@interface ViewController : UIViewController<PersonDelegate,IObserver>


@end

