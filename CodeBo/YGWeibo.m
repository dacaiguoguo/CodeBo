//
//  YGWeibo.m
//  CodeBo
//
//  Created by sunyanguo on 14-2-9.
//  Copyright (c) 2014年 sunyanguo. All rights reserved.
//

#import "YGWeibo.h"

@implementation YGWeibo
- (NSDictionary *)getMap{
    return @{
             @"created_at" : @"created_at",
             };
}
@end


@implementation WeiboVisible

- (NSDictionary *)getMap{
    return @{
             @"videoURL" : @"@URL(contentURL)",
             @"name" : @"title",
             @"videoType" : @"type",
             @"sub_object" : @{
                     @"title" : @"uniqueID"
                     }
             };
}

@end

@implementation YGWeiboFriendsTimeline


- (NSDictionary *)getMap{
    return @{
             @"statuses" : @"@Selector(videoTypeFromString:, statuses)",
             @"ad" : @"ad"
             };
}
//! implemented on instance you are parsing
- (NSArray *)videoTypeFromString:(NSArray *)objArray
{
    NSMutableArray *mut = nil;
    if (objArray>0) {
        mut = [NSMutableArray array];
    }
    for (id obj in objArray){
        YGWeibo *ret = [YGWeibo new];
        [KZPropertyMapper mapValuesFrom:obj toInstance:ret];
        [mut addObject:ret];
    }
    return mut;
}
@end