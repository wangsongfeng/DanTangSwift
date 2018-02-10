//
//  Person.m
//  DanTangSwift
//
//  Created by apple on 2017/10/14.
//  Copyright © 2017年 yangchao. All rights reserved.
//

#import "Person.h"

@implementation Person

-(instancetype)initWithName:(NSString*)name{
    if (self==[super init]) {
        NSLog(@"这是一段OC 代码 Swift 调用OC");
        
    }
    return self;
}

-(void)getname{
    NSLog(@"我的名字是 松锋");
}

@end
