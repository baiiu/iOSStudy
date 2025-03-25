//
//  ViewController.m
//  iOSStudy
//
//  Created by ByteDance on 2025/3/25.
//

#import "ViewController.h"

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
}


@end
