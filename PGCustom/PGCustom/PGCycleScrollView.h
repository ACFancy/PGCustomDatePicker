//
//  PGCycleScrollView.h
//  PGCustom
//
//  Created by ianc on 15/11/24.
//  Copyright © 2015年 PGWizard. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PGCycleScrollViewDelegate;
@protocol PGCycleScrollViewDataSource;

@interface PGCycleScrollView : UIView

@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, strong, nullable) UIScrollView *scrollView;
@property (nonatomic, weak, nullable) id <PGCycleScrollViewDelegate>delegate;
@property (nonatomic, weak, nullable) id <PGCycleScrollViewDataSource>dataSource;

- (void)reloadData;

@end

@protocol PGCycleScrollViewDelegate <NSObject>

@optional

- (void)scrollViewDidChangeNumber;

@end

@protocol PGCycleScrollViewDataSource <NSObject>

@required
- (NSInteger)numberOfCells:(nonnull PGCycleScrollView *)scrollView;
- (nonnull UIView *)cellAtIndex:(NSInteger)index andScrollView:(nonnull PGCycleScrollView *)scrollView;

@end