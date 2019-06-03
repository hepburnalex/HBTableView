//
//  HBRefreshTableView.m
//  HBTableView
//
//  Created by Hepburn on 2019/5/29.
//  Copyright © 2019 ihope. All rights reserved.
//

#import "HBRefreshTableView.h"
#import <MJRefresh/MJRefresh.h>

#ifndef WS//(weakSelf)
#define WS(weakSelf)  __weak __typeof (&*self)weakSelf = self
#endif

@implementation HBRefreshTableView

#pragma mark - LifeCycle

- (instancetype)init {
    self = [super init];
    if (self) {
        [self CreateUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self CreateUI];
    }
    return self;
}

- (void)CreateUI {
    //自动更改透明度
    self.mj_header.automaticallyChangeAlpha = YES;
    self.isAddFooter = YES;
    self.isAddHeader = YES;
    self.isNoMoreData = YES;
    self.cacheHeightDict = [NSMutableDictionary dictionary];
    
    self.rowHeight = UITableViewAutomaticDimension;
    self.estimatedRowHeight = 100;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;    
    self.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
}

#pragma mark - Action
- (void)runRefreshAction:(BOOL)isHeader {
    if (isHeader) {
        self.isNoMoreData = NO;
        if (self.refreshDelegate && [self.refreshDelegate respondsToSelector:@selector(tableHeaderWithRefreshing:)]) {
            [self.refreshDelegate tableHeaderWithRefreshing:self];
        }
    }
    else {
        if (self.refreshDelegate && [self.refreshDelegate respondsToSelector:@selector(tableFooterWithRefreshing:)]) {
            [self.refreshDelegate tableFooterWithRefreshing:self];
        }
    }
}

- (void)beginRefreshing {
    [self.mj_header beginRefreshing];
}

- (void)reloadData {
    [super reloadData];
    [self endRefresh];
}

- (void)endRefresh {
    if ([self.mj_header isKindOfClass:[MJRefreshNormalHeader class]]) {
        if (self.mj_header.isRefreshing) {
            [self.mj_header endRefreshing];
        }
    }
    if ([self.mj_footer isKindOfClass:[MJRefreshAutoNormalFooter class]]) {
        if (self.mj_footer.isRefreshing && !self.isNoMoreData) {
            [self.mj_footer endRefreshing];
        }
    }
}

- (void)endRefresh:(BOOL)isNoMoreData {
    if ([self.mj_header isKindOfClass:[MJRefreshNormalHeader class]]) {
        [self.mj_header endRefreshing];
    }
    if ([self.mj_footer isKindOfClass:[MJRefreshAutoNormalFooter class]]) {
        if (isNoMoreData) {
            [self.mj_footer endRefreshingWithNoMoreData];
        }
        else {
            [self.mj_footer endRefreshing];
        }
    }
}

#pragma mark - Property

- (void)setRefreshDelegate:(id)refreshDelegate {
    _refreshDelegate = refreshDelegate;
    self.dataSource = refreshDelegate;
    self.delegate = refreshDelegate;
}

- (void)setIsAddHeader:(BOOL)isAddHeader {
    _isAddHeader = isAddHeader;
    if (isAddHeader) {
        WS(weakSelf);
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf runRefreshAction:YES];
        }];
    }
    else{
        self.mj_header = (MJRefreshNormalHeader *)[[UIView alloc] init];
    }
}

- (void)setIsAddFooter:(BOOL)isAddFooter {
    _isAddFooter = isAddFooter;
    if (isAddFooter) {
        WS(weakSelf);
        self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [weakSelf runRefreshAction:NO];
        }];
    }
    else {
        self.mj_footer = (MJRefreshBackNormalFooter *)[[UIView alloc] init];
    }
}

- (void)setIsNoMoreData:(BOOL)isNoMoreData {
    _isNoMoreData = isNoMoreData;
    if ([self.mj_footer isKindOfClass:[MJRefreshAutoNormalFooter class]]) {
        if (isNoMoreData) {
            [self.mj_footer endRefreshingWithNoMoreData];
        }
        else {
            [self.mj_footer resetNoMoreData];
        }
    }
}

@end
