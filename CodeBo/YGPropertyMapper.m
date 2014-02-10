//
//  YGPropertyMapper.m
//  CodeBo
//
//  Created by dacaiguoguo on 14-2-10.
//  Copyright (c) 2014年 sunyanguo. All rights reserved.
//

#import "YGPropertyMapper.h"

@implementation NSObject (getMap)

- (NSDictionary *)getMap{
    return nil;
}

@end

@implementation KZPropertyMapper(YGPropertyMapper)
+ (BOOL)mapValuesFrom:(id)arrayOrDictionary toInstance:(id)instance{
    return [KZPropertyMapper mapValuesFrom:arrayOrDictionary toInstance:instance usingMapping:[instance getMap]];
}
@end
