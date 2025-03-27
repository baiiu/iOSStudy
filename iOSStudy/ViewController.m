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
    button2.frame=CGRectMake(140, 200, 340, 130);
    button2.backgroundColor=[UIColor redColor];
    [button2 setTitle:@"点我一下"
            forState:UIControlStateNormal];
    [button2 addTarget:self
            action:@selector(test)
            forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
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
    
    Person *p2 = [[Person alloc]initWithNameAge:@"Tom":20];
    [p2 updateAge:21];
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
    NSLog(@"p2 testAddition: %d", [p2 testAddition:1 :1]);
    
}

Person *p_global;

-(void) test {
    Person *p2 = [[Person alloc]initWithNameAge:@"Tom":20];
    p_global = p2;
    [p_global addObserver:self forKeyPath:NSStringFromSelector(@selector(age)) options:NSKeyValueObservingOptionNew context:nil];
    [p_global addObserver:self forKeyPath:NSStringFromSelector(@selector(name)) options:NSKeyValueObservingOptionNew context:nil];
    
    p2.name = @"Anna";
    p2.age = 21;
    [p2 updateAge:22];
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(age))] && object == p_global) {
        NSNumber* number = [change objectForKey:NSKeyValueChangeNewKey];
        int newAge = [[change objectForKey:NSKeyValueChangeNewKey]intValue];
        NSLog(@"observeValueForKeyPath newAge: %d, %d", newAge, number);
    }
}


-(void)dealloc {
    [p_global removeObserver:self forKeyPath:NSStringFromSelector(@selector(age))];
    [p_global removeObserver:self forKeyPath:NSStringFromSelector(@selector(name))];
}


#pragma mark PersonDelegate
-(void)personDidSayHello {
    NSLog(@"personDidSayHello");
}


@end
