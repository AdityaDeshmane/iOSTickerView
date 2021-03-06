//
//  ADTickerViewController.h
//  TickerView
//
//  Created by Aditya Deshmane on 04/01/14.
//  Copyright (c) 2014 Aditya Deshmane. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADTickerViewController : NSObject

+ (void)addTickerInView:(UIView*) viewForTicker
             textString:(NSString*) textString
               textFont:(UIFont*) font
              textColor:(UIColor*) textColor
     andBackgrountColor:(UIColor*) bgColor;

@end
