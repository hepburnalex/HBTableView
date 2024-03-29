//
//  HBRefreshTableView.h
//  HBTableView
//
//  Created by Hepburn on 2019/5/29.
//  Copyright © 2019 ihope. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class HBRefreshTableView;

@protocol HBRefreshTableViewDelegate <NSObject>

@optional
- (void)tableFooterWithRefreshing:(HBRefreshTableView *)tableView;
- (void)tableHeaderWithRefreshing:(HBRefreshTableView *)tableView;

@end

@interface HBRefreshTableView : UITableView

@property (nonatomic,weak) id refreshDelegate;

/// 是否添加刷新header 默认YES
@property (nonatomic,assign) BOOL isAddHeader;
///是否添加刷新fooder 默认YES
@property (nonatomic,assign) BOOL isAddFooter;
///是否显示无数据提示 默认YES
@property (nonatomic,assign) BOOL isNoMoreData;

@property (nonatomic,strong) NSMutableDictionary *cacheHeightDict;
///开始刷新
- (void)beginRefreshing;
///结束刷新
- (void)endRefresh;
- (void)endRefresh:(BOOL)isNoMoreData;

@end;

NS_ASSUME_NONNULL_END
