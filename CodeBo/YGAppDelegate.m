//
//  YGAppDelegate.m
//  CodeBo
//
//  Created by sunyanguo on 14-1-16.
//  Copyright (c) 2014年 sunyanguo. All rights reserved.
//

#import "YGAppDelegate.h"
#import "Reachability.h"
#import "KZPropertyMapper.h"

@implementation YGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self newtworkType];
    self.wbtoken = @"2.00zg7wFCYb_w7C2ef95203f3MLznRB";
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:kAppKey];
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{@"wbtoken": self.wbtoken}];
    NSURL *weiboUrl = [[NSURL alloc] initWithScheme:@"https" host:@"api.weibo.com" path:@"/2/statuses/friends_timeline.json?access_token=2.00zg7wFCYb_w7C2ef95203f3MLznRB"];
    NSURLRequest *webRequest = [NSURLRequest requestWithURL:weiboUrl];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDataTask *downloadTask = [session dataTaskWithRequest:webRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                //update ui
                LVLog(@"%@",jsonObj);
                
                
            });
        }
    }];
    [downloadTask resume];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [WeiboSDK handleOpenURL:url delegate:self];
}

#pragma mark WeiboSDK Delegate
- (void)didReceiveWeiboRequest:(WBBaseRequest *)request
{
    if ([request isKindOfClass:WBProvideMessageForWeiboRequest.class])
    {
        LVLog(@"dacaiguoguo:\n%s\n%@",__func__,nil);
    }
}

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    if ([response isKindOfClass:WBSendMessageToWeiboResponse.class])
    {
        NSString *message = [NSString stringWithFormat:@"响应状态: %d\n响应UserInfo数据: %@\n原请求UserInfo数据: %@",(int)response.statusCode, response.userInfo, response.requestUserInfo];
        LVLog(@"dacaiguoguo:\n%s\n发送结果：%@",__func__,message);

    }
    else if ([response isKindOfClass:WBAuthorizeResponse.class])
    {
        NSString *message = [NSString stringWithFormat:@"响应状态: %d\nresponse.userId: %@\nresponse.accessToken: %@\n响应UserInfo数据: %@\n原请求UserInfo数据: %@",(int)response.statusCode,[(WBAuthorizeResponse *)response userID], [(WBAuthorizeResponse *)response accessToken], response.userInfo, response.requestUserInfo];
        LVLog(@"dacaiguoguo:\n%s\n认证结果：%@",__func__,message);
        self.wbtoken = [(WBAuthorizeResponse *)response accessToken];


    }
}

- (void)requestData{
    
}


-(void)newtworkType {
    
    NSArray *subviews = [[[[UIApplication sharedApplication] valueForKey:@"statusBar"] valueForKey:@"foregroundView"]subviews];
    NSNumber *dataNetworkItemView = nil;
    
    for (id subview in subviews) {
        if([subview isKindOfClass:[NSClassFromString(@"UIStatusBarDataNetworkItemView") class]]) {
            dataNetworkItemView = subview;
            break;
        }
    }
    
    
    switch ([[dataNetworkItemView valueForKey:@"dataNetworkType"]integerValue]) {
        case 0:
            NSLog(@"No wifi or cellular");
            break;
            
        case 1:
            NSLog(@"2G");
            break;
            
        case 2:
            NSLog(@"3G");
            break;
            
        case 3:
            NSLog(@"4G");
            break;
            
        case 4:
            NSLog(@"LTE");
            break;
            
        case 5:
            NSLog(@"Wifi");
            break;
            
            
        default:
            break;
    }
}





@end



