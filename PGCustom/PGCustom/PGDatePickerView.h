//
//  PGDatePickerView.h
//  PGCustom
//
//  Created by ianc on 15/11/24.
//  Copyright © 2015年 PGWizard. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PGUIDatePickerMode) {
    
    UIPGDatePickerModeDate,  // Displays month, day, and year depending on the locale setting (e.g. November | 15 | 2007)
    
    UIPGDatePickerModeDateMonth, //(e.g 2015 10)
    
    UIPGDatePickerModeDateWeekOfYear //(e.g 2015年第23周8/31-9/6)
};


@interface PGDatePickerView : UIControl

@property (nonatomic) PGUIDatePickerMode datePickerMode;//default is UIPGDatePickerModeTime
@property (nullable, nonatomic, strong) NSDate *date;       // default is current date when picker created. Ignored in countdown timer mode. for that mode, picker starts at 0:00
@property (nonatomic, readonly, nullable) NSString *dateStr;

- (void)show;

@end
