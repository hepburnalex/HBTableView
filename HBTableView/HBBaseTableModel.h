//
//  HBBaseTableModel.h
//  HBTableView
//
//  Created by Hepburn on 2019/5/29.
//  Copyright © 2019 ihope. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HBBaseTableModel : NSObject

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSMutableArray *modelList;

@end

NS_ASSUME_NONNULL_END
