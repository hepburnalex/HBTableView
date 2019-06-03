//
//  LNRTestListCell.h
//  TestTableView
//
//  Created by Hepburn on 2019/5/30.
//  Copyright © 2019 ihope. All rights reserved.
//

#import <HBTableView/HBBaseTableViewCell.h>

NS_ASSUME_NONNULL_BEGIN

@interface LNRTestListCell : HBBaseTableViewCell

@property(nonatomic,strong) UILabel *bookNameLabel;
@property(nonatomic,strong) UILabel *bookDescribeLabel;

@end

NS_ASSUME_NONNULL_END
