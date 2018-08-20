//
//  ViewController.m
//  Effective OC
//
//  Created by 杨旭东 on 2018/8/14.
//  Copyright © 2018年 火眼征信. All rights reserved.
//

#import "ViewController.h"
#import "EOCEmployee.h"

// 每个枚举的下标从0开始，逐次递增,位运算符(左移)，这种形式可以组合使用
enum EOCConnectionState {
    EOCConectionStateDisconnected = 1 << 0,
    EOCConectionStateConnecting = 1 << 1,
    EOCConectionStateConnected = 1 << 2,
};

//方向，可同时支持一个或多个方向
typedef enum _TTGDirection {
    TTGDirectionNone = 0,
    TTGDirectionTop = 1 << 0,
    TTGDirectionLeft = 1 << 1,
    TTGDirectionRight = 1 << 2,
    TTGDirectionBottom = 1 << 3
} TTGDirection;

// 使用switch语句
typedef enum _TTGState{
    TTGStateOK = 0,
    TTGStateError,
    TTGStateUnknow,
    TTGstateNew
} TTGstate;

// 指明枚举类型
TTGstate state = TTGStateOK;


@interface ViewController ()

// switch开关属性的定义
@property (nonatomic, getter=isOn) BOOL on;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[EOCEmployee employeeWithType:EOCEmployeeTypeFinance] doADaysWork];
    [EOCEmployee employeeWithType:EOCEmployeeTypeFinance];
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    NSLog(@"current state == %d", EOCConectionStateConnected);
    NSLog(@"current state == %d", EOCConectionStateConnecting);
    NSLog(@"current state == %d", EOCConectionStateDisconnected);
    
    NSLog(@"\n********************************\n");
    
    
    NSLog(@"current state == %d", EOCConectionStateConnected | EOCConectionStateConnecting);
    NSLog(@"current state == %d", EOCConectionStateConnected | EOCConectionStateConnecting | EOCConectionStateDisconnected);
    
    
    //用“或”运算同时赋值多个选项，组合选择感觉还是很有用的
    TTGDirection direction = TTGDirectionTop | TTGDirectionLeft | TTGDirectionBottom;
    
    //用“与”运算取出对应位
    if (direction & TTGDirectionTop) {
        NSLog(@"top");
    }
    if (direction & TTGDirectionLeft) {
        NSLog(@"left");
    }
    if (direction & TTGDirectionRight) {
        NSLog(@"right");
    }
    if (direction & TTGDirectionBottom) {
        NSLog(@"bottom");
    }
    

    // 调用方法
    [self dealWithState:TTGStateUnknow];
    
}

// 定义switch用法
- (void)dealWithState:(TTGstate)state
{
    switch (state) {
        case TTGStateOK:
            NSLog(@"ok");
            break;
        case TTGStateError:
            NSLog(@"error");
            break;
        case TTGStateUnknow:
            NSLog(@"Unkonow");
            break;
        // 尽量不要使用default语句，避免忘记处理enum的新加状态
//        default:
//            break;
        case TTGstateNew:
            NSLog(@"new");
            break;
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
