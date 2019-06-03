//
//  HBBaseTableViewController.m
//  HBTableView
//
//  Created by Hepburn on 2019/5/29.
//  Copyright © 2019 ihope. All rights reserved.
//

#import "HBBaseTableViewController.h"
#import <Masonry/Masonry.h>

#ifndef WS//(weakSelf)
#define WS(weakSelf)  __weak __typeof (&*self)weakSelf = self
#endif

@interface HBBaseTableViewController () <UITableViewDelegate, UITableViewDataSource, HBRefreshTableViewDelegate> {

}

@property(nonatomic, strong) NSMutableDictionary *modelDict;
@property (nonatomic, strong) NSArray *cellClasses;

@end

@implementation HBBaseTableViewController

- (HBRefreshTableView *)tableView {
    if (!_tableView) {
        _tableView = [[HBRefreshTableView alloc] init];
        _tableView.refreshDelegate = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.modelDict = [[NSMutableDictionary alloc] init];
    [self.view addSubview:self.tableView];
    WS(weakSelf);
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(ios 11.0,*)) make.edges.mas_equalTo(weakSelf.view.safeAreaInsets);
        else make.edges.mas_equalTo(weakSelf.view);
    }];
}

#pragma mark - Property

- (void)setIsShowFooter:(BOOL)isShowFooter {
    self.tableView.isAddFooter = isShowFooter;
}

- (BOOL)isShowFooter {
    return self.tableView.isAddFooter;
}

- (void)setIsShowHeader:(BOOL)isShowHeader {
    self.tableView.isAddHeader = isShowHeader;
}

- (BOOL)isShowHeader {
    return self.tableView.isAddHeader;
}

#pragma mark - Action

- (void)refreshView:(BOOL)bNoMore {
    [self.tableView endRefresh:bNoMore];
    [self.tableView reloadData];
}

- (void)reloadTable {
    
}

- (void)loadMoreTable {
    
}

- (void)loadTableCell:(HBBaseTableViewCell *)cell {
    
}

- (void)tableCellDidSelect:(NSIndexPath *)indexPath :(HBBaseTableModel *)model {
    
}

- (void)CleanModels {
    [self.modelDict removeAllObjects];
    [self.tableView reloadData];
}

- (void)loadSectionModels:(NSString *)classname models:(NSArray *)array section:(NSInteger)section {
    HBBaseTableModel *model = [[HBBaseTableModel alloc] init];
    model.identifier = classname;
    [model.modelList addObjectsFromArray:array];
    [self.modelDict setObject:model forKey:@(section)];
}

#pragma mark - Refresh

- (void)tableFooterWithRefreshing:(HBRefreshTableView *)tableView {
    [self loadMoreTable];
}

- (void)tableHeaderWithRefreshing:(HBRefreshTableView *)tableView {
    [self reloadTable];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _modelDict.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    HBBaseTableModel *model = _modelDict[@(section)];
    return model.modelList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HBBaseTableModel *model = _modelDict[@(indexPath.section)];
    if (!model) {
        return nil;
    }
    Class cellClass = NSClassFromString(model.identifier);
    HBBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:model.identifier];
    if (!cell) {
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:model.identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [self loadTableCell:cell];
    }
    cell.model = model.modelList[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSNumber *height = [self.tableView.cacheHeightDict objectForKey:indexPath];
    if(height){
        return height.floatValue;
    }
    else{
        return 100;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSNumber *height = @(cell.frame.size.height);
    [self.tableView.cacheHeightDict setObject:height forKey:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HBBaseTableModel *model = _modelDict[@(indexPath.section)];
    if (!model) {
        return;
    }
    [self tableCellDidSelect:indexPath :model.modelList[indexPath.row]];
}

@end
