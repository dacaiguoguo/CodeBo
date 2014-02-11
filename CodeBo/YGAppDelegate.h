//
//  YGAppDelegate.h
//  CodeBo
//
//  Created by sunyanguo on 14-1-16.
//  Copyright (c) 2014年 sunyanguo. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface YGAppDelegate : UIResponder <UIApplicationDelegate,WeiboSDKDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *wbtoken;
@end
