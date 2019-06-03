//
//  HBBaseTableViewController.h
//  HBTableView
//
//  Created by Hepburn on 2019/5/29.
//  Copyright © 2019 ihope. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBRefreshTableView.h"
#import "HBBaseTableViewCell.h"
#import "HBBaseTableModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HBBaseTableViewController : UIViewController

@property(nonatomic, strong) HBRefreshTableView *tableView;

@property (nonatomic, assign) BOOL isShowHeader;
@property (nonatomic, assign) BOOL isShowFooter;

- (void)refreshView:(BOOL)bNoMore;

/* 加载数据 */
- (void)loadSectionModels:(NSString *)classname models:(NSArray *)array section:(NSInteger)section;

// 以下方法需要重写

/* 重新加载 */
- (void)reloadTable;
/* 加载更多 */
- (void)loadMoreTable;
/* 设置cell相关属性 */
- (void)loadTableCell:(HBBaseTableViewCell *)cell;
/* cell选中时间 */
- (void)tableCellDidSelect:(NSIndexPath *)indexPath :(id)model;

@end

NS_ASSUME_NONNULL_END
