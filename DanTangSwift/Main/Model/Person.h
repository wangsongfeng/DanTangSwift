//
//  Person.h
//  DanTangSwift
//
//  Created by apple on 2017/10/14.
//  Copyright © 2017年 yangchao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic,assign)int  age;
-(instancetype)initWithName:(NSString*)name;
-(void)getname;
@end
