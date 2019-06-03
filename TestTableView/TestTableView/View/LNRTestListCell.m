//
//  LNRTestListCell.m
//  TestTableView
//
//  Created by Hepburn on 2019/5/30.
//  Copyright © 2019 ihope. All rights reserved.
//

#import "LNRTestListCell.h"
#import "LNRTestListModel.h"
#import "HBBaseHeader.h"
#import <Masonry/Masonry.h>

@implementation LNRTestListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (UILabel *)bookNameLabel{
    if (!_bookNameLabel) {
        _bookNameLabel = [[UILabel alloc] init];
        _bookNameLabel.textColor = [UIColor blackColor];
        _bookNameLabel.font = UIBoldFont(16);
        _bookNameLabel.text = @"神笔马良故事";
    }
    return _bookNameLabel;
}

- (UILabel *)bookDescribeLabel{
    if (!_bookDescribeLabel) {
        _bookDescribeLabel = [[UILabel alloc] init];
        _bookDescribeLabel.textColor = [UIColor grayColor];
        _bookDescribeLabel.font = UISystemFont(14);
        _bookDescribeLabel.text = @"经典童话故事帮助宝贝成长";
        _bookDescribeLabel.numberOfLines = 0;
    }
    return _bookDescribeLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.layer.shouldRasterize = YES;
        self.layer.rasterizationScale = [UIScreen mainScreen].scale;
        
        [self.contentView addSubview:self.bookNameLabel];
        [self.contentView addSubview:self.bookDescribeLabel];
        
        WS(weakSelf);
        [self.bookNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            MAS_LEFT(weakSelf.contentView, CGFloatAutoFit(20));
            MAS_TOP(weakSelf.contentView, CGFloatAutoFit(10));
            MAS_RIGHT(weakSelf.contentView, -CGFloatAutoFit(20));
        }];
        
        [self.bookDescribeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            MAS_LEFT(weakSelf.bookNameLabel, 0);
            MAS_TOP(weakSelf.bookNameLabel.mas_bottom, CGFloatAutoFit(8));
            MAS_WIDTH(weakSelf.bookNameLabel);
            MAS_BOTTOM(weakSelf.contentView, -CGFloatAutoFit(10)).priorityHigh();
        }];
    }
    return self;
}

- (void)setModel:(id)model{
    [super setModel:model];
    LNRTestListModel *tmpModel = (LNRTestListModel *)model;
    
    self.bookNameLabel.text = tmpModel.name;
    self.bookDescribeLabel.text = tmpModel.desc;
}

@end
