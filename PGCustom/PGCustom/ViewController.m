//
//  ViewController.m
//  PGCustom
//
//  Created by ianc on 15/11/24.
//  Copyright © 2015年 PGWizard. All rights reserved.
//

#import "ViewController.h"
#import "PGDatePickerView.h"

#define COLOR(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    PGCycleScrollView *scrollView = [[PGCycleScrollView alloc] initWithFrame:CGRectMake(15, 70, 290, 223)];
//    scrollView.currentPage = 2015-2000;
//    scrollView.delegate = self;
//    scrollView.dataSource = self;
//    [self setAfterScrollShowView:scrollView andCurrentPage:3];
//    [self.view addSubview:scrollView];
    
    PGDatePickerView *datePicker = [[PGDatePickerView alloc] initWithFrame:CGRectMake(15, 70, 290, 223)];
    datePicker.datePickerMode = UIPGDatePickerModeDateWeekOfYear;
    datePicker.date = [NSDate date];
    [datePicker show];
    [self.view addSubview:datePicker];
}


//- (void)setAfterScrollShowView:(PGCycleScrollView*)scrollView  andCurrentPage:(NSInteger)currentPage
//{
//    UILabel *lblPre3 = (UILabel *)scrollView.subviews[0].subviews[currentPage-3];
//    lblPre3.font = [UIFont systemFontOfSize:15];
//    lblPre3.textColor = COLOR(185, 184, 184, 1);
//    
//    UILabel *lblPre2 = (UILabel *)scrollView.subviews[0].subviews[currentPage - 2];
//    lblPre2.font = [UIFont systemFontOfSize:15];
//    lblPre2.textColor = COLOR(185, 184, 184, 1);
//    UILabel *lblPre1 = (UILabel *)scrollView.subviews[0].subviews[currentPage - 1];
//    lblPre1.font = [UIFont systemFontOfSize:17];
//    lblPre1.textColor = COLOR(147, 152, 156, 1);
//    UILabel *lblCurrent = (UILabel *)scrollView.subviews[0].subviews[currentPage];
//    lblCurrent.font = [UIFont systemFontOfSize:20];
//    lblCurrent.textColor = COLOR(236,103,36,1);
//    UILabel *lblLast1 = (UILabel *)scrollView.subviews[0].subviews[currentPage + 1];
//    lblLast1.font = [UIFont systemFontOfSize:17];
//    lblLast1.textColor = COLOR(147, 152, 156, 1);
//    UILabel *lblLast2 = (UILabel *)scrollView.subviews[0].subviews[currentPage + 2];
//    lblLast2.font = [UIFont systemFontOfSize:15];
//    lblLast2.textColor = COLOR(185, 184, 184, 1);
//    
//    UILabel *lblLast3 = (UILabel *)scrollView.subviews[0].subviews[currentPage + 3];
//    lblLast3.font = [UIFont systemFontOfSize:15];
//    lblLast3.textColor = COLOR(185, 184, 184, 1);
//}
//
//#pragma mark PGCycleScrollView DataSource
//- (NSInteger)numberOfCells:(PGCycleScrollView *)scrollView {
//    return 99;
//}
//
//- (UIView *)cellAtIndex:(NSInteger)index andScrollView:(PGCycleScrollView *)scrollView {
//    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, scrollView.bounds.size.width, scrollView.bounds.size.height/5)];
//    l.tag = index;
//    l.textAlignment = NSTextAlignmentCenter;
//    l.backgroundColor = [UIColor clearColor];
//    l.text = [NSString stringWithFormat:@"%d",2000+index];
//    return l;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
