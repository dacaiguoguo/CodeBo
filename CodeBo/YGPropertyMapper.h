//
//  YGPropertyMapper.h
//  CodeBo
//
//  Created by dacaiguoguo on 14-2-10.
//  Copyright (c) 2014年 sunyanguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KZPropertyMapper.h"
#import "YGWeibo.h"

@interface NSObject (getMap)
- (NSDictionary *)getMap;
@end

@interface KZPropertyMapper(YGPropertyMapper)
+ (BOOL)mapValuesFrom:(id)arrayOrDictionary toInstance:(id)instance;
@end
