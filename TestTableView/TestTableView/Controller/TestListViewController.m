//
//  TestListViewController.m
//  TestTableView
//
//  Created by Hepburn on 2019/6/3.
//  Copyright © 2019 Hepburn. All rights reserved.
//

#import "TestListViewController.h"
#import "LNRTestListModel.h"

@interface TestListViewController ()

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) NSMutableArray *dataList;

@end

@implementation TestListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试";
    self.page = 0;
    self.dataList = [[NSMutableArray alloc] init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self reloadTable];
}

- (void)AddModelsToList {
    for (int i = 0; i < 10; i ++) {
        LNRTestListModel *model = [[LNRTestListModel alloc] init];
        model.name = [NSString stringWithFormat:@"测试测试d测试测试测试%d", i];
        int iCount = arc4random_uniform(100);
        NSString *desc = @"测试测试测试测试测试";
        for (int j = 0; j < iCount; j ++) {
            desc = [desc stringByAppendingString:@"测试"];
        }
        model.desc = desc;
        [self.dataList addObject:model];
    }
}

#pragma mark - HBBaseTableViewController

- (void)reloadTable {
    self.page = 0;
    [self.dataList removeAllObjects];
    [self AddModelsToList];
    [self loadSectionModels:@"LNRTestListCell" models:self.dataList section:0];
    [self refreshView:NO];
}

- (void)loadMoreTable {
    self.page ++;
    [self AddModelsToList];
    [self loadSectionModels:@"LNRTestListCell" models:self.dataList section:0];
    [self refreshView:(self.page >= 3)];
}

- (void)loadTableCell:(HBBaseTableViewCell *)cell {
    
}

- (void)tableCellDidSelect:(NSIndexPath *)indexPath :(id)model {
    LNRTestListModel *tmpModel = (LNRTestListModel *)model;
    NSLog(@"%@", tmpModel.name);
}

@end
