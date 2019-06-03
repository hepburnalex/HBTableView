//
//  HBBaseTableModel.m
//  HBTableView
//
//  Created by Hepburn on 2019/5/29.
//  Copyright © 2019 ihope. All rights reserved.
//

#import "HBBaseTableModel.h"

@implementation HBBaseTableModel

- (id)init {
    self = [super init];
    if (self) {
        self.modelList = [[NSMutableArray alloc] initWithCapacity:10];
    }
    return self;
}

@end
