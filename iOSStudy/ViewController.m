//
//  ViewController.m
//  iOSStudy
//
//  Created by ByteDance on 2025/3/25.
//

#import "ViewController.h"
#import "Person.h"
#import "Person+Setting.h"
#import "Person+Location.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame=CGRectMake(40, 100, 240, 30);
    button.backgroundColor=[UIColor redColor];
    [button setTitle:@"点我一下"
            forState:UIControlStateNormal];
    [button addTarget:self
               action:@selector(changeColor)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.frame=CGRectMake(40, 200, 340, 30);
    button2.backgroundColor=[UIColor greenColor];
    [button2 setTitle:@"test other"
             forState:UIControlStateNormal];
    [button2 addTarget:self
                action:@selector(test)
      forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton * button3 = [UIButton buttonWithType:UIButtonTypeSystem];
    button3.frame=CGRectMake(40, 300, 340, 30);
    button3.backgroundColor=[UIColor cyanColor];
    [button3 setTitle:@"test_gcd"
             forState:UIControlStateNormal];
    [button3 addTarget:self
                action:@selector(test_gcd)
      forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    
    
    
    // 创建并添加 RotatingView 组件到 ViewController 的主视图
    UIView *rotatingView = [[UIView alloc] initWithFrame:CGRectMake(100, 700, 50, 50)];
    rotatingView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:rotatingView];
    [self addRotationAnimationToView:rotatingView];
}

// 创建并添加旋转动画到视图
- (void)addRotationAnimationToView:(UIView *)view {
    // 创建旋转动画
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    // 设置动画属性
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI * 2.0]; // 旋转一周
    rotationAnimation.duration = 2.0; // 持续时间
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    rotationAnimation.repeatCount = HUGE_VALF; // 无限重复
    
    // 将动画添加到视图的图层
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

// 按钮点击响应事件
-(void)changeColor{
    self.view.backgroundColor=[UIColor colorWithRed:arc4random()%255/255.0
                                              green:arc4random()%255/255.0
                                               blue:arc4random()%255/255.0
                                              alpha:1];
    
    Person *p = [Person new];
    [p print];
    [p setNameAge:@"Alex" age:20];
    [p print];
    
    Person *p1 = [[Person alloc] init];
    p1.age = 10;
    int older = [p1 compare:p];
    NSLog(@"older: %d, %@", older, p);
    
    Person *p2 = [[Person alloc]initWithNameAge:@"Tom" age:20];
    [p2 setObserver:self];
    [p2 updateAge:21];
    [p2 setAge:22];
    [p2 setNameAge:@"Anna" age:23];
    [p2 resetSex:true];
    NSLog(@"p2: %@", p2);
    
    [p2 eat];
    [p2 drink];
    [p2 sleep];
    
    p2.delegate = self;
    [p2 sayHello];
    // extension私有，无法调用
    //    [p2 updateLocation:@"some where"];
    //    NSLog(@"location: %@, %@",p2, [p2 getLocation]);
    
    simpleBlock block = ^(){
        NSLog(@"this is simpleBlock");
    };
    MethOperatorBlock addition = ^(int a, int b) {
        return a + b;
    };
    block();
    NSLog(@"addtion: %d", addition(1,1));
    
    [p2 configAddOperator:addition];
    NSLog(@"p2 testAddition: %d", [p2 testAddition:1 b:1]);
    
}


#pragma mark PersonDelegate
-(void)personDidSayHello {
    NSLog(@"personDidSayHello");
}

#pragma mark IObserver
-(void)onAgeUpdated:(int) newAge oldAge:(int)oldAge {
    NSLog(@"onAgeUpdated: %d, %d", newAge, oldAge);
}

#pragma mark test
Person *p_global;

-(void) test {
    Person *p2 = [[Person alloc]initWithNameAge:@"Tom" age:20];
    p_global = p2;
    [p_global addObserver:self forKeyPath:NSStringFromSelector(@selector(age)) options:NSKeyValueObservingOptionNew context:nil];
    [p_global addObserver:self forKeyPath:NSStringFromSelector(@selector(name)) options:NSKeyValueObservingOptionNew context:nil];
    
    p2.name = @"Anna";
    p2.age = 21;
    [p2 updateAge:22];
    
    
    [NSNotificationCenter.defaultCenter
     addObserver:self
     selector:@selector(handleGreetingNotification:)
     name:@"GreetingNotification"
     object:nil];
    
    NSNotification* noti = [[NSNotification alloc]initWithName:@"GreetingNotification" object:nil userInfo:nil];
    [NSNotificationCenter.defaultCenter postNotification:noti];
    [NSNotificationCenter.defaultCenter postNotificationName:@"GreetingNotification" object:nil];
    NSDictionary *userInfo = @{@"message": @"Hello, World!"};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"GreetingNotification" object:nil userInfo:userInfo];
    
    
    SEL selector1 = @selector(personDidSayHello);
    SEL selector2 = NSSelectorFromString(@"personDidSayHello");
    NSLog(@"###selector1: %d, selector2: %d", selector1, selector2);
    
    // 使用 respondsToSelector: 方法判断对象是否能够响应某个选择器：
    if ([self respondsToSelector:selector1]) {
        [self performSelector:selector1];
    }
    if ([self respondsToSelector:selector2]) {
        [self performSelector:selector2];
    }
    
    if ([self respondsToSelector:@selector(personDidSayHello)]) {
        [self performSelector:@selector(personDidSayHello)];
    }
    if ([self respondsToSelector:NSSelectorFromString(@"personDidSayHello")]) {
        [self performSelector:NSSelectorFromString(@"personDidSayHello")];
    }
    
    SEL ageUpdated = @selector(onAgeUpdated:oldAge:);
    if ([self respondsToSelector:ageUpdated]) {
        NSDictionary *params = @{@"oldAge": @(50), @"newAge": @(51)};
        NSLog(@"params: %d", params);
        // 这里可以看到传入了一个dict进去，参数接收的都是同一个了
        [self performSelector:ageUpdated withObject:params];
    }
    
    // 获取方法签名
    NSMethodSignature *signature = [self methodSignatureForSelector:ageUpdated];
    if (!signature) {
        NSLog(@"Method not found.");
        return;
    }
    
    // 创建 NSInvocation 对象
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setSelector:ageUpdated];
    [invocation setTarget:self];
    
    // 设置参数
    int newAge = 1;
    int oldAge = 2;
    [invocation setArgument:&newAge atIndex:2]; // 索引 0 和 1 分别是 target 和 selector
    [invocation setArgument:&oldAge atIndex:3]; // 索引 0 和 1 分别是 target 和 selector
    
    // 调用
    [invocation invoke];
    
    NSLog(@"111");
    
    
    
    //    if ([self respondsToSelector:@selector(onAgeUpdated)]) {
    //        NSLog(@"ageUpdated found");
    //        [self performSelector:@selector(onAgeUpdated) withObject:1 withObject:2];
    //    } else {
    //        NSLog(@"ageUpdated not found");
    //    }
    
    
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(age))] && object == p_global) {
        NSNumber* number = [change objectForKey:NSKeyValueChangeNewKey];
        int newAge = [[change objectForKey:NSKeyValueChangeNewKey]intValue];
        NSLog(@"observeValueForKeyPath newAge: %d, %d", newAge, number);
    }
}


-(void)handleGreetingNotification:(NSNotification*)notification {
    NSLog(@"handleGreetingNotification: %@", notification.name);
    
    NSDictionary *userInfo = notification.userInfo;
    NSString *message = userInfo[@"message"];
    NSLog(@"Received greeting: %@", message);
}


-(void)dealloc {
    [p_global removeObserver:self forKeyPath:NSStringFromSelector(@selector(age))];
    [p_global removeObserver:self forKeyPath:NSStringFromSelector(@selector(name))];
    [NSNotificationCenter.defaultCenter removeObserver:self];
}


# pragma mark test_gcd

- (void)printCurrentThreadID:(NSString*)logStr {
    // 获取当前线程对象
    NSThread *currentThread = [NSThread currentThread];
    NSDate *currentDate = [NSDate date];

    // 打印线程的标识符
    NSLog(@"%@ Thread ID: %@, %@", currentDate, currentThread, logStr);
}

-(void) test_gcd {
    [self printCurrentThreadID:@"test_gcd"];
    
    dispatch_queue_t main_queue = dispatch_get_main_queue();
    dispatch_async(main_queue, ^{
        [self printCurrentThreadID:@"111"];
    });
    
//    [NSThread sleepForTimeInterval:5.0]; // 只会阻塞被调用线程，动画线程在core animation线程运行，不会阻塞
    
//    NSThread *thread = [[NSThread alloc]initWithBlock:^{
//        @autoreleasepool {
//            [self printCurrentThreadID:@"run in thread"];
//            
//            [NSThread sleepForTimeInterval:2.0];
//            [self printCurrentThreadID:@"run in thread after 2s"];
//            
//            [self printCurrentThreadID:@"dispatch before"];
//            dispatch_async(main_queue, ^{
//                [self printCurrentThreadID:@"dispatch here111"];
//                [NSThread sleepForTimeInterval:2.0];
//                [self printCurrentThreadID:@"dispatch here111111"];
//            });
//            
//            dispatch_sync(main_queue, ^{
//                [self printCurrentThreadID:@"dispatch here222"];
//                [NSThread sleepForTimeInterval:2.0];
//                [self printCurrentThreadID:@"dispatch here222222"];
//            });
//            [self printCurrentThreadID:@"dispatch after"]; // 需要等待dispatch_sync完成
//        }
//    }];
//    [thread start];
    
    
    NSThread *thread2 = [[NSThread alloc]initWithBlock:^{
        @autoreleasepool {
            dispatch_queue_t main_queue = dispatch_get_main_queue();
            for (int i = 0; i < 30; ++i) {
                [self printCurrentThreadID:[NSString stringWithFormat:@"to dispatch block on none-main thread %d", i]];
                // 因为是耗时任务，在main_queue中排队被执行
                dispatch_async(main_queue, ^{
                    [self printCurrentThreadID:[NSString stringWithFormat:@"test here %d", i]];
                    [NSThread sleepForTimeInterval:2.0];
                    [self printCurrentThreadID:[NSString stringWithFormat:@"after test here  %d", i]];
                });
            }
        }
    }];
    [thread2 start];
    
    
    
}


@end
