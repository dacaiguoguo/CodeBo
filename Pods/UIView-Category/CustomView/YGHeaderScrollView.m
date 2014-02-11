//
//  YGHeaderView.m
//  priceImage
//
//  Created by dacaiguoguo on 14-1-27.
//  Copyright (c) 2014年 dacaiguoguo. All rights reserved.
//

#import "YGHeaderScrollView.h"

@interface YGHeaderScrollView ()
{
    CGFloat orgY;
}
@end


@implementation YGHeaderScrollView

- (void)setHeaderView:(UIView *)headerView{
    [_headerView removeFromSuperview];
    _headerView = headerView;
    orgY = CGRectGetMinY(_headerView.frame);
    [self addSubview:headerView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    const CGSize boundsSize = self.bounds.size;
    const CGFloat contentOffset = self.contentOffset.y;
    const CGRect visibleBounds = CGRectMake(0,contentOffset,boundsSize.width,boundsSize.height);
    CGRect sectionRect = [self bounds];
    if (CGRectIntersectsRect(sectionRect, visibleBounds)) {
        const CGRect headerRect = CGRectMake(0,MAX(orgY, contentOffset),boundsSize.width,CGRectGetHeight(_headerView.frame));
        if (_headerView) {
            _headerView.frame = headerRect;
        }
    }
}
@end
