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
    
    // extension私有，无法调用
//    [p2 updateLocation:@"some where"];
//    NSLog(@"location: %@, %@",p2, [p2 getLocation]);
}




@end
