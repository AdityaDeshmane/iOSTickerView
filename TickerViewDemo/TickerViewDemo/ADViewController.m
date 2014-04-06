//
//  ADViewController.m
//  TickerViewDemo
//
//  Created by Aditya Deshmane on 02/02/14.
//  Copyright (c) 2014 Aditya Deshmane. All rights reserved.
//

#import "ADViewController.h"


//Step 1/3 - Import ticker view cotroller
#import "ADTicker.h"


@interface ADViewController ()

@end

@implementation ADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Step 2/3 - Configure
    NSString *text = @"String shorter than label width";
    UIView *tickerView = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 200, 20)];
    
    [ADTicker addTickerInView:tickerView
                                 textString:text
                                   textFont:[UIFont systemFontOfSize:10]
                                  textColor:[UIColor whiteColor]
                         andBackgrountColor:[UIColor grayColor]];
    
    //Step 3/3 - Add as subview
    [self.view addSubview:tickerView];
    
    
    
    /* TWO MORE EXAMPLES */
    NSString *text2 = @"Message bigger length than frame..";
    UIView *tickerView2 = [[UIView alloc] initWithFrame:CGRectMake(10, 200, 200, 40)];

    [ADTicker addTickerInView:tickerView2 textString:text2
                                   textFont:[UIFont boldSystemFontOfSize:22]
                                  textColor:[UIColor yellowColor]
                         andBackgrountColor:[UIColor redColor]];
    [self.view addSubview:tickerView2];
    
    NSString *text3 = @"VERY VERY LONG TEST TEXT MESSAGE WITH ITALICS FONT SIZE 14..";
    UIView *tickerView3 = [[UIView alloc] initWithFrame:CGRectMake(10, 300, 250, 30)];

    [ADTicker addTickerInView:tickerView3
                                 textString:text3
                                   textFont:[UIFont italicSystemFontOfSize:14]
                                  textColor:[UIColor whiteColor]
                         andBackgrountColor:[UIColor blueColor]];
    [self.view addSubview:tickerView3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
