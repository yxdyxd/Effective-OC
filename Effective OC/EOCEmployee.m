//
//  EOCEmployee.m
//  Effective OC
//
//  Created by 杨旭东 on 2018/8/17.
//  Copyright © 2018年 火眼征信. All rights reserved.
//

#import "EOCEmployee.h"
#import "EOCEmployeeDeveloper.h"
#import "EOCEmployeeFinance.h"
#import "EOCEmployeeDesigner.h"

@implementation EOCEmployee

+ (EOCEmployee *)employeeWithType:(EOCEmployeeType)type
{
    switch (type) {
        case EOCEmployeeTypeDeveloper:
            return [EOCEmployeeDeveloper new];
            break;
            
        case EOCEmployeeTypeDesigner:
            return [EOCEmployeeDesigner new];
            break;
            
        case EOCEmployeeTypeFinance:
            return [EOCEmployeeFinance new];
            break;
    }
}

- (void)doADaysWork
{
    NSLog(@"此处可以重写");
}

@end
