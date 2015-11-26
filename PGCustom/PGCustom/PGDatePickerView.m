//
//  PGDatePickerView.m
//  PGCustom
//
//  Created by ianc on 15/11/24.
//  Copyright © 2015年 PGWizard. All rights reserved.
//

#import "PGDatePickerView.h"
#import "PGCycleScrollView.h"
#import "NSDate+PG.h"

#define COLOR(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define SCROLLVIEWD_HEIGHT 223
#define SCROLLVIEW_WIDTH (self.datePickerMode == UIPGDatePickerModeDate ? 290.0/3.0: (self.datePickerMode == UIPGDatePickerModeDateMonth ? 290.0/2.0 : 290.0))



@interface PGDatePickerView ()<PGCycleScrollViewDelegate,PGCycleScrollViewDataSource>{
   UIView  *timeBroadcastView;
   PGCycleScrollView *yearScrollView;
   PGCycleScrollView *monthScrollView;
   PGCycleScrollView *dayScrollView;
   PGCycleScrollView *weekScrollView;
   NSDateFormatter *dateFromatter;
   NSArray *weeksOfYearStrArray;
}

@end

@implementation PGDatePickerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
       
    }
    return self;
    
}

- (void)show {
   [self setTimeBroadcaseView];
}

#pragma mark - custompicker
//设置定义的datepicker界面
- (void)setTimeBroadcaseView {
    timeBroadcastView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 290, 223)];
    
    //    CGColorRef cgColor = [UIColor colorWithRed:221.0/255.0 green:221.0/255.0 blue:221.0/255.0 alpha:1.0].CGColor;
    
    [timeBroadcastView setBackgroundColor:COLOR(249, 249, 249, 1)];
    [self addSubview:timeBroadcastView];
    
    UIView *leftTimeBroadcastViewLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 3, 223)];
    leftTimeBroadcastViewLine.backgroundColor = COLOR(207, 207, 207, 207);
    [timeBroadcastView addSubview:leftTimeBroadcastViewLine];
    
    
    
    
    UIView *middleSepView = [[UIView alloc] initWithFrame:CGRectMake(0, 87, 290, 48)];
    [middleSepView setBackgroundColor:COLOR(255.0, 255.0, 255.0, 1.0)];
    [timeBroadcastView addSubview:middleSepView];
    
    UIView *beforeSepLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 290, 1)];
    [beforeSepLine setBackgroundColor:COLOR(237.0, 237.0, 237.0, 1.0)];
    [middleSepView addSubview:beforeSepLine];
    
    UIView *bottomSepLine = [[UIView alloc] initWithFrame:CGRectMake(0, 47, 290, 1)];
    [bottomSepLine setBackgroundColor:COLOR(237.0, 237.0, 237.0, 1.0)];
    [middleSepView addSubview:bottomSepLine];
    
    UIView *leftLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 3, 48)];
    leftLine.backgroundColor = COLOR(236,103,36,1);
    [middleSepView addSubview:leftLine];
    
    switch (self.datePickerMode) {
        case UIPGDatePickerModeDate:
            [self layoutDateModeView:middleSepView];
            break;
        case UIPGDatePickerModeDateMonth:
            [self layoutDateMonthModeView:middleSepView];
            break;
        case UIPGDatePickerModeDateWeekOfYear:
            weeksOfYearStrArray = [NSDate getWeekOfYearStringArray];
            [self layoutDateWeekOfYearModeView:middleSepView];
            break;
        default:
            break;
    }
    
}

//布局年月日格式
- (void)layoutDateModeView:(UIView *)middleSepView {
    //年月日字的布局
    UILabel *lblYear = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, 290.0/3.0, 40)];
    lblYear.font = [UIFont systemFontOfSize:10];
    lblYear.textColor = COLOR(236,103,36,1);
    lblYear.text = @"年";
    [middleSepView addSubview:lblYear];
    
    UILabel *lblMonth = [[UILabel alloc] initWithFrame:CGRectMake(290.0/3.0+60, 0, 290.0/3.0, 40)];
    lblMonth.font = [UIFont systemFontOfSize:10];
    lblMonth.textColor = COLOR(236,103,36,1);
    lblMonth.text = @"月";
    [middleSepView addSubview:lblMonth];
    
    
    UILabel *lblDay = [[UILabel alloc] initWithFrame:CGRectMake(580.0/3.0+60, 0, 290.0/3.0, 40)];
    lblDay.font = [UIFont systemFontOfSize:10];
    lblDay.textColor = COLOR(236,103,36,1);
    lblDay.text = @"日";
    [middleSepView addSubview:lblDay];
    
    //线
    UIView *rightTimeBroadcastViewLine = [[UIView alloc] initWithFrame:CGRectMake(289, 0, 1, 223)];
    rightTimeBroadcastViewLine.backgroundColor = COLOR(207, 207, 207, 207);
    [timeBroadcastView addSubview:rightTimeBroadcastViewLine];
    UIView *topTimeBroadcastViewLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 290, 1)];
    topTimeBroadcastViewLine.backgroundColor = COLOR(207, 207, 207, 207);
    [timeBroadcastView addSubview:topTimeBroadcastViewLine];
    UIView *bottomTimeBroadcastViewLine = [[UIView alloc] initWithFrame:CGRectMake(0, 222, 290, 1)];
    bottomTimeBroadcastViewLine.backgroundColor = COLOR(207, 207, 207, 207);
    [timeBroadcastView addSubview:bottomTimeBroadcastViewLine];
    
    //年月日中间的先
    UIView *middleLeftLine = [[UIView alloc] initWithFrame:CGRectMake(290/3.0, 0, 1, 223)];
    middleLeftLine.backgroundColor = COLOR(207, 207, 207, 207);
    [timeBroadcastView addSubview:middleLeftLine];
    
    UIView *middleRightLine = [[UIView alloc] initWithFrame:CGRectMake(580/3.0, 0, 1, 223)];
    middleRightLine.backgroundColor = COLOR(207, 207, 207, 207);
    [timeBroadcastView addSubview:middleRightLine];
    
    dateFromatter = [[NSDateFormatter alloc] init];
    dateFromatter.dateFormat = @"yyyyMMdd";
    
    [self setYearScrollView];
    [self setMonthScrollView];
    [self setDayScrollView];
}

//DateMonthMode 的布局
- (void)layoutDateMonthModeView:(UIView *)middleSepView {
    UILabel *lblYear = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 290.0/2.0, 40)];
    lblYear.font = [UIFont systemFontOfSize:10];
    lblYear.textColor = COLOR(236,103,36,1);
    lblYear.text = @"年";
    [middleSepView addSubview:lblYear];
    
    UILabel *lblMonth = [[UILabel alloc] initWithFrame:CGRectMake(290.0/2.0+85, 0, 290.0/2.0, 40)];
    lblMonth.font = [UIFont systemFontOfSize:10];
    lblMonth.textColor = COLOR(236,103,36,1);
    lblMonth.text = @"月";
    [middleSepView addSubview:lblMonth];
    
    //线
    UIView *rightTimeBroadcastViewLine = [[UIView alloc] initWithFrame:CGRectMake(289, 0, 1, 223)];
    rightTimeBroadcastViewLine.backgroundColor = COLOR(207, 207, 207, 207);
    [timeBroadcastView addSubview:rightTimeBroadcastViewLine];
    UIView *topTimeBroadcastViewLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 290, 1)];
    topTimeBroadcastViewLine.backgroundColor = COLOR(207, 207, 207, 207);
    [timeBroadcastView addSubview:topTimeBroadcastViewLine];
    UIView *bottomTimeBroadcastViewLine = [[UIView alloc] initWithFrame:CGRectMake(0, 222, 290, 1)];
    bottomTimeBroadcastViewLine.backgroundColor = COLOR(207, 207, 207, 207);
    [timeBroadcastView addSubview:bottomTimeBroadcastViewLine];
    
    //中间的线
    UIView *middleTimeBroadcaseViewLine = [[UIView alloc] initWithFrame:CGRectMake(290.0/2.0-1, 0, 1, 223)];
    middleTimeBroadcaseViewLine.backgroundColor = COLOR(207, 207, 207, 207);
    [timeBroadcastView addSubview:middleTimeBroadcaseViewLine];
    
    dateFromatter = [[NSDateFormatter alloc] init];
    dateFromatter.dateFormat = @"yyyyMM";
    
    [self setYearScrollView];
    [self setMonthScrollView];
}

//DateWeekOfYearMode 的布局
- (void)layoutDateWeekOfYearModeView:(UIView *)middleSepView {
    //线
    UIView *rightTimeBroadcastViewLine = [[UIView alloc] initWithFrame:CGRectMake(289, 0, 1, 223)];
    rightTimeBroadcastViewLine.backgroundColor = COLOR(207, 207, 207, 207);
    [timeBroadcastView addSubview:rightTimeBroadcastViewLine];
    UIView *topTimeBroadcastViewLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 290, 1)];
    topTimeBroadcastViewLine.backgroundColor = COLOR(207, 207, 207, 207);
    [timeBroadcastView addSubview:topTimeBroadcastViewLine];
    UIView *bottomTimeBroadcastViewLine = [[UIView alloc] initWithFrame:CGRectMake(0, 222, 290, 1)];
    bottomTimeBroadcastViewLine.backgroundColor = COLOR(207, 207, 207, 207);
    [timeBroadcastView addSubview:bottomTimeBroadcastViewLine];
    
    [self setWeekScrollView];
}


//设置年月日时分的滚动视图
- (void)setYearScrollView
{
    yearScrollView = [[PGCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, SCROLLVIEW_WIDTH, SCROLLVIEWD_HEIGHT)];
    NSInteger yearint = [self setNowTimeShow:0];
    yearScrollView.currentPage = yearint - 2000;
    yearScrollView.delegate = self;
    yearScrollView.dataSource = self;
    [self setAfterScrollShowView:yearScrollView andCurrentPage:3];
    yearScrollView.tag = 0;
    [timeBroadcastView addSubview:yearScrollView];
}
//设置年月日时分的滚动视图
- (void)setMonthScrollView
{
    monthScrollView = [[PGCycleScrollView alloc] initWithFrame:CGRectMake(SCROLLVIEW_WIDTH, 0, SCROLLVIEW_WIDTH, SCROLLVIEWD_HEIGHT)];
    NSInteger monthint = [self setNowTimeShow:1];
    monthScrollView.currentPage = monthint - 1;
    monthScrollView.delegate = self;
    monthScrollView.dataSource = self;
    [self setAfterScrollShowView:monthScrollView andCurrentPage:3];
    monthScrollView.tag  = 1;
    [timeBroadcastView addSubview:monthScrollView];
}
//设置年月日时分的滚动视图
- (void)setDayScrollView
{
    dayScrollView = [[PGCycleScrollView alloc] initWithFrame:CGRectMake(SCROLLVIEW_WIDTH * 2, 0, SCROLLVIEW_WIDTH, SCROLLVIEWD_HEIGHT)];
    NSInteger dayint = [self setNowTimeShow:2];
    dayScrollView.currentPage = dayint - 1;
    dayScrollView.delegate = self;
    dayScrollView.dataSource = self;
    [self setAfterScrollShowView:dayScrollView andCurrentPage:3];
    dayScrollView.tag = 2;
    [timeBroadcastView addSubview:dayScrollView];
}

//设置周日期的滚动视图
- (void)setWeekScrollView {

    weekScrollView = [[PGCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, SCROLLVIEW_WIDTH, SCROLLVIEWD_HEIGHT)];
    NSDateComponents *todayDateComponents = [NSDate dateComponentsFromDate:self.date];
    NSInteger todayWeekOfYear = todayDateComponents.weekOfYear;
    todayWeekOfYear= todayWeekOfYear - 1;
    weekScrollView.currentPage = todayWeekOfYear;
    weekScrollView.delegate = self;
    weekScrollView.dataSource = self;
    [self setAfterScrollShowView:weekScrollView andCurrentPage:3];
    weekScrollView.tag = 3;
    [timeBroadcastView addSubview:weekScrollView];
}

//设置现在时间
- (NSInteger)setNowTimeShow:(NSInteger)timeType
{
    NSDate *now = self.date;
    NSString *dateString = [dateFromatter stringFromDate:now];
    switch (timeType) {
        case 0:
        {
            NSRange range = NSMakeRange(0, 4);
            NSString *yearString = [dateString substringWithRange:range];
            return yearString.integerValue;
        }
            break;
        case 1:
        {
            NSRange range = NSMakeRange(4, 2);
            NSString *yearString = [dateString substringWithRange:range];
            return yearString.integerValue;
        }
            break;
        case 2:
        {
            NSRange range = NSMakeRange(6, 2);
            NSString *yearString = [dateString substringWithRange:range];
            return yearString.integerValue;
        }
            break;
        default:
            break;
    }
    return 0;
}

//截取时间 年，月，日
- (NSInteger)setNowTimeShow:(NSInteger)timeType withDate:(NSDate *)date
{
    NSDate *now = date;
    NSString *dateString = [dateFromatter stringFromDate:now];
    switch (timeType) {
        case 0:
        {
            NSRange range = NSMakeRange(0, 4);
            NSString *yearString = [dateString substringWithRange:range];
            return yearString.integerValue;
        }
            break;
        case 1:
        {
            NSRange range = NSMakeRange(4, 2);
            NSString *yearString = [dateString substringWithRange:range];
            return yearString.integerValue;
        }
            break;
        case 2:
        {
            NSRange range = NSMakeRange(6, 2);
            NSString *yearString = [dateString substringWithRange:range];
            return yearString.integerValue;
        }
            break;
        default:
            break;
    }
    return 0;
}


- (void)setAfterScrollShowView:(PGCycleScrollView*)scrollView  andCurrentPage:(NSInteger)currentPage
{
    UILabel *lblPre3 = (UILabel *)scrollView.subviews[0].subviews[currentPage-3];
    lblPre3.font = [UIFont systemFontOfSize:15];
    lblPre3.textColor = COLOR(185, 184, 184, 1);
    
    UILabel *lblPre2 = (UILabel *)scrollView.subviews[0].subviews[currentPage - 2];
    lblPre2.font = [UIFont systemFontOfSize:15];
    lblPre2.textColor = COLOR(185, 184, 184, 1);
    UILabel *lblPre1 = (UILabel *)scrollView.subviews[0].subviews[currentPage - 1];
    lblPre1.font = [UIFont systemFontOfSize:17];
    lblPre1.textColor = COLOR(147, 152, 156, 1);
    UILabel *lblCurrent = (UILabel *)scrollView.subviews[0].subviews[currentPage];
    lblCurrent.font = [UIFont systemFontOfSize:20];
    lblCurrent.textColor = COLOR(236,103,36,1);
    UILabel *lblLast1 = (UILabel *)scrollView.subviews[0].subviews[currentPage + 1];
    lblLast1.font = [UIFont systemFontOfSize:17];
    lblLast1.textColor = COLOR(147, 152, 156, 1);
    UILabel *lblLast2 = (UILabel *)scrollView.subviews[0].subviews[currentPage + 2];
    lblLast2.font = [UIFont systemFontOfSize:15];
    lblLast2.textColor = COLOR(185, 184, 184, 1);
    
    UILabel *lblLast3 = (UILabel *)scrollView.subviews[0].subviews[currentPage + 3];
    lblLast3.font = [UIFont systemFontOfSize:15];
    lblLast3.textColor = COLOR(185, 184, 184, 1);
}


#pragma mark - PGCycleScrollView DataSource
- (NSInteger)numberOfCells:(PGCycleScrollView *)scrollView {
    switch (self.datePickerMode) {
        case UIPGDatePickerModeDate:
            {
                if ([scrollView isEqual:yearScrollView]) {
                    return 99;
                }else if([scrollView isEqual:monthScrollView]){
                    return 12;
                }else {
                    return [NSDate daysfromYear:yearScrollView.currentPage+2000 andMonth:monthScrollView.currentPage + 1];
                }
            }
            break;
        case UIPGDatePickerModeDateMonth:
           {
               if ([scrollView isEqual:yearScrollView]) {
                   return 99;
               }else if([scrollView isEqual:monthScrollView]){
                   return 12;
               }
           }
        case UIPGDatePickerModeDateWeekOfYear:
          {
              if ([scrollView isEqual:weekScrollView]) {
                  return 53;
              }
          }
        default:
            break;
    }
    return 0;
}

- (UIView *)cellAtIndex:(NSInteger)index andScrollView:(PGCycleScrollView *)scrollView {
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, scrollView.bounds.size.width, scrollView.bounds.size.height/5.0)];
    l.tag = index;
    switch (self.datePickerMode) {
        case UIPGDatePickerModeDate:
            {
                if ([scrollView isEqual:yearScrollView]) {
                    l.text = [NSString stringWithFormat:@"%li",(index + 2000) ];
                }else if([scrollView isEqual:monthScrollView]){
                    l.text = [NSString stringWithFormat:@"%li",(index + 1)];
                }else if([scrollView isEqual:dayScrollView]) {
                    l.text = [NSString stringWithFormat:@"%li",(index + 1)];
                }
            }
            break;
        case UIPGDatePickerModeDateMonth:
            {
                if ([scrollView isEqual:yearScrollView]) {
                    l.text = [NSString stringWithFormat:@"%li",(index + 2000) ];
                }else if([scrollView isEqual:monthScrollView]){
                    l.text = [NSString stringWithFormat:@"%li",(index + 1)];
                }
            }
            break;
        case UIPGDatePickerModeDateWeekOfYear:
           {
               if ([scrollView isEqual:weekScrollView]) {
                   l.text = weeksOfYearStrArray[index];
               }
           }
        default:
            break;
    }

    l.textAlignment = NSTextAlignmentCenter;
    return l;
}

#pragma mark - PGCycleScrollView Delegate
- (void)scrollViewDidChangeNumber {
    switch (self.datePickerMode) {
        case UIPGDatePickerModeDate:
            {
                [self dealDateModeChange];
            }
            break;
        case UIPGDatePickerModeDateMonth:
           {
               [self dealDateMonthModeChange];
           }
            break;
        case UIPGDatePickerModeDateWeekOfYear:
           {
             [self dealWeekOfYearModeChange];
           }
            break;
        default:
            break;
    }
    
    
}

//处理DateMode(年月日)的事件
- (void)dealDateModeChange{
    UILabel *yearLabel = [[(UILabel*)[[yearScrollView subviews] objectAtIndex:0] subviews] objectAtIndex:3];
    UILabel *monthLabel = [[(UILabel*)[[monthScrollView subviews] objectAtIndex:0] subviews] objectAtIndex:3];
    UILabel *dayLabel = [[(UILabel*)[[dayScrollView subviews] objectAtIndex:0] subviews] objectAtIndex:3];
    NSInteger yearInt = yearLabel.text.integerValue;
    NSInteger monthInt = monthLabel.text.integerValue;
    NSInteger dayInt = dayLabel.text.integerValue;
    
    yearScrollView.currentPage = yearLabel.tag;
    monthScrollView.currentPage = monthLabel.tag;
    NSInteger days = [NSDate daysfromYear:yearInt andMonth:monthInt];
    if (dayInt > days) {
        dayInt = days;
    }
    
    NSDate *selectedDate = [dateFromatter dateFromString:[NSString stringWithFormat:@"%02ld%02ld%02ld",yearInt,monthInt,dayInt]];
    if ([selectedDate compare:[NSDate date]] == NSOrderedDescending) {
        yearInt = [self setNowTimeShow:0 withDate:[NSDate date]];
        monthInt = [self setNowTimeShow:1 withDate:[NSDate date]];
        dayInt = [self setNowTimeShow:2 withDate:[NSDate date]];
        yearScrollView.currentPage = yearInt - 2000;
        monthScrollView.currentPage = monthInt - 1;
        dayScrollView.currentPage = dayInt - 1;
        
        [yearScrollView reloadData];
        [self setAfterScrollShowView:yearScrollView andCurrentPage:3];
        
        [monthScrollView reloadData];
        [self setAfterScrollShowView:monthScrollView andCurrentPage:3];
        
        [dayScrollView reloadData];
        [self setAfterScrollShowView:dayScrollView andCurrentPage:3];
        
    }else {
        dayScrollView.currentPage = dayInt -1;
        [dayScrollView reloadData];
        
        [self setAfterScrollShowView:dayScrollView andCurrentPage:3];
    }

}

//处理DateMonthMode(年月)的事件
- (void)dealDateMonthModeChange {
    UILabel *yearLabel = [[(UILabel*)[[yearScrollView subviews] objectAtIndex:0] subviews] objectAtIndex:3];
    UILabel *monthLabel = [[(UILabel*)[[monthScrollView subviews] objectAtIndex:0] subviews] objectAtIndex:3];
    NSInteger yearInt = yearLabel.text.integerValue;
    NSInteger monthInt = monthLabel.text.integerValue;
    
    NSDate *selectedDate = [dateFromatter dateFromString:[NSString stringWithFormat:@"%02ld%02ld",yearInt,monthInt]];
    if ([selectedDate compare:[NSDate date]] == NSOrderedDescending) {
        yearInt = [self setNowTimeShow:0 withDate:[NSDate date]];
        monthInt = [self setNowTimeShow:1 withDate:[NSDate date]];
        yearScrollView.currentPage = yearInt - 2000;
        monthScrollView.currentPage = monthInt - 1;
        
        [yearScrollView reloadData];
        [self setAfterScrollShowView:yearScrollView andCurrentPage:3];
        
        [monthScrollView reloadData];
        [self setAfterScrollShowView:monthScrollView andCurrentPage:3];
    }
}

//处理WeekOfYearMode(周日期)的事件
- (void)dealWeekOfYearModeChange {
    UILabel *weekOfYearLabel = [[(UILabel*)[[weekScrollView subviews] objectAtIndex:0] subviews] objectAtIndex:3];
    NSInteger weekOfYear = weekOfYearLabel.tag;
    
    NSDateComponents *todayDateComponents = [NSDate dateComponentsFromDate:[NSDate date]];
    NSInteger todayWeekOfYear = todayDateComponents.weekOfYear;
    todayWeekOfYear= todayWeekOfYear - 1;
    
    if (weekOfYear > todayWeekOfYear) {
        weekScrollView.currentPage = todayWeekOfYear;
        
        [weekScrollView reloadData];
        [self setAfterScrollShowView:weekScrollView andCurrentPage:3];
    }
    
}


@end
