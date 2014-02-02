//
//  ADTickerViewController.h
//  TickerView
//
//  Created by Aditya Deshmane on 04/01/14.
//  Copyright (c) 2014 Aditya Deshmane. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADTickerViewController : UIViewController
- (id)initTickerWithFrame:(CGRect) frame
               textString:(NSString*) textString
                 textFont:(UIFont*) font
                textColor:(UIColor*) textColor
       andBackgrountColor:(UIColor*) bgColor;

@end
