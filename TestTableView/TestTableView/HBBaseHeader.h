//
//  BaseHeader.h
//  TestCollectionView
//
//  Created by Hepburn on 2018/12/19.
//  Copyright © 2018 Hepburn. All rights reserved.
//

#ifndef BaseHeader_h
#define BaseHeader_h

#import <Masonry.h>

#define UIViewAutoresizingFlexibleFourMargin UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin

#define UIViewAutoresizingFlexibleFullMargin UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight

///字体
#define UIBoldFont(a) [UIFont fontWithName:@"Helvetica-Bold" size:CGFloatAutoFit(a)]
#define UISystemFont(a) [UIFont systemFontOfSize:CGFloatAutoFit(a)]

#define CGFloatAutoFit(a) a*([UIScreen mainScreen].bounds.size.width/375.)


#define kScreenWidth    [UIScreen mainScreen].bounds.size.width
#define kScreenHeight   [UIScreen mainScreen].bounds.size.height
#define kStatusBarHeight    [[UIApplication sharedApplication] statusBarFrame].size.height

#define WS(weakSelf)  __weak __typeof (&*self)weakSelf = self

#define MAS_TOP(x, y)       make.top.mas_equalTo(x).offset(y)
#define MAS_LEFT(x, y)      make.left.mas_equalTo(x).offset(y)
#define MAS_BOTTOM(x, y)    make.bottom.mas_equalTo(x).offset(y)
#define MAS_RIGHT(x, y)     make.right.mas_equalTo(x).offset(y)
#define MAS_CENTERX(x, y)   make.centerX.mas_equalTo(x).offset(y)
#define MAS_CENTERY(x, y)   make.centerY.mas_equalTo(x).offset(y)
#define MAS_CENTER(x)       make.center.mas_equalTo(x)
#define MAS_WIDTH(x)        make.width.mas_equalTo(x)
#define MAS_HEIGHT(x)       make.height.mas_equalTo(x)
#define MAS_SIZE(x)         make.width.height.mas_equalTo(x)
#define MAS_SIZES(w, h)     make.width.mas_equalTo(w);make.height.mas_equalTo(h)
#define MAS_EDGES(x)        make.edges.mas_equalTo(x)

#define MAS_TOPBOTTOM(x, y)         make.top.bottom.mas_equalTo(x).offset(y)
#define MAS_LEFTRIGHT(x, y)         make.left.right.mas_equalTo(x).offset(y)
#define MAS_TOPLEFT(x, y)           make.top.left.mas_equalTo(x).offset(y)
#define MAS_TOPRIGHT(x, y)          make.top.right.mas_equalTo(x).offset(y)
#define MAS_TOPLEFTRIGHT(x, y)      make.top.left.right.mas_equalTo(x).offset(y)
#define MAS_BOTTOMLEFT(x, y)        make.bottom.left.mas_equalTo(x).offset(y)
#define MAS_BOTTOMRIGHT(x, y)       make.bottom.right.mas_equalTo(x).offset(y)
#define MAS_BOTTOMLEFTRIGHT(x, y)   make.bottom.left.right.mas_equalTo(x).offset(y)

#endif /* BaseHeader_h */
