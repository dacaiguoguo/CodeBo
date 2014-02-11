//
//  YGWeibo.h
//  CodeBo
//
//  Created by sunyanguo on 14-2-9.
//  Copyright (c) 2014年 sunyanguo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, WeiboVisibleStatusType)
{
    WeiboVisibleStatusTypeNormal               = 0,//0：普通微博
    WeiboVisibleStatusTypePrivate            = 1,//1：私密微博
    WeiboVisibleStatusTypeAZu              = 3,//3：指定分组微博
    WeiboVisibleStatusTypeMiYou              = 4,//4：密友微博
};


@class WeiboVisible;
@interface YGWeibo : NSObject
/**
 *  string	微博创建时间
 */
@property (strong, nonatomic) NSString *created_at;
/**
 *  int64	微博ID
 */
@property (assign) int weiboId;
/**
 *  mid	int64	微博MID
 */
@property (assign) int mid;
/**
 *  string	字符串型的微博ID
 */
@property (strong, nonatomic) NSString *idstr;
/**
 *  string	微博信息内容
 */
@property (strong, nonatomic) NSString *text;
/**
 *  string	微博来源
 */
@property (strong, nonatomic) NSString *source;
/**
 *  boolean	是否已收藏，true：是，false：否
 */
@property (assign) BOOL favorited;
/**
 *  boolean	是否被截断，true：是，false：否
 */
@property (assign) BOOL truncated;
/**
 *  string	（暂未支持）回复ID
 */
@property (strong, nonatomic) NSString *in_reply_to_status_id;
/**
 *  string	（暂未支持）回复人UID
 */
@property (strong, nonatomic) NSString *in_reply_to_user_id;
/**
 *  string	（暂未支持）回复人昵称
 */
@property (strong, nonatomic) NSString *in_reply_to_screen_name;
/**
 *  string	缩略图片地址，没有时不返回此字段
 */
@property (strong, nonatomic) NSString *thumbnail_pic;
/**
 *  string	中等尺寸图片地址，没有时不返回此字段
 */
@property (strong, nonatomic) NSString *bmiddle_pic;
/**
 *  string	原始图片地址，没有时不返回此字段
 */
@property (strong, nonatomic) NSString *original_pic;
//geo	object	地理信息字段 详细
//user	object	微博作者的用户信息字段 详细
//retweeted_status	object	被转发的原微博信息字段，当该微博为转发微博时返回 详细
/**
 *  int	转发数
 */
@property (assign) int reposts_count;//
/**
 *  int	评论数
 */
@property (assign) int comments_count;
/**
 *  int	表态数
 */
@property (assign) int attitudes_count;
/**
 *  object	微博的可见性及指定可见分组信息。该object中type取值，0：普通微博，1：私密微博，3：指定分组微博，4：密友微博；list_id为分组的组号
 */
@property (strong, nonatomic) WeiboVisible* visible;
/**
 *  object	微博配图地址。多图时返回多图链接。无配图返回“[]”
 */
@property (strong, nonatomic) NSArray* pic_urls;	//object;//	微博配图地址。多图时返回多图链接。无配图返回“[]”
/**
 *  object array	微博流内的推广微博ID
 */
@property (strong, nonatomic) NSArray*ad;
@end


/**
 *  WeiboVisible object	微博的可见性及指定可见分组信息。该object中type取值，0：普通微博，1：私密微博，3：指定分组微博，4：密友微博；list_id为分组的组号
 */
@interface WeiboVisible : NSObject
@property (assign) WeiboVisibleStatusType type;
@property (assign) int list_id;
@end

