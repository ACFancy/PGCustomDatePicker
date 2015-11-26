//
//  NSDate+PG.h
//  PGDatePicker
//
//  Created by ianc on 15/11/18.
//  Copyright © 2015年 PGWizard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (PG)

+ (NSString *)dateToString:(NSDate *)date;
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;
+ (NSDate *)dateWithYear:(NSInteger)yearNum;
+ (NSInteger)daysfromYear:(NSInteger)year andMonth:(NSInteger)month;
+ (NSDateComponents *)dateComponentsFromDate:(NSDate *)date;
+ (NSArray *)getWeekOfYearStringArray;
@end
