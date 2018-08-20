//
//  EOCEmployee.h
//  Effective OC
//
//  Created by 杨旭东 on 2018/8/17.
//  Copyright © 2018年 火眼征信. All rights reserved.
//

#import <Foundation/Foundation.h>

// 创建类族
// 格式：typedef NS_ENUM(存储类型，属性类型){枚举成员}；
typedef NS_ENUM(NSUInteger, EOCEmployeeType){
    EOCEmployeeTypeDeveloper,
    EOCEmployeeTypeDesigner,
    EOCEmployeeTypeFinance,
};

@interface EOCEmployee : NSObject

// 创建类族的属性
@property (copy) NSString *name;
@property NSUInteger salary;

// 创建类族的方法
// 创建雇工事件
+ (EOCEmployee*)employeeWithType:(EOCEmployeeType)type;

// 让雇员做的日常工作
- (void)doADaysWork;


@end
