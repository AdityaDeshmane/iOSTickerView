Ticker View
===========

Info : 

Works for : iOS 4 and above

Uses ARC : Yes

Xcode : 4 and above (Developed using 5.0.1)

Base SDK : 7.0 (Setting lower will aslo work)

Uses storybord/xib ? : Ticker View created programmatically, will work with both storybord or xib based project


How to use ?


1. Add following view controller's files to your project

   A. ADTickerViewController.h
   
   B. ADTickerViewController.m

2. How to use above classes
   
   Sample code :
   
   NSString *text2 = @"Message bigger length than frame.."; //This is your text string

   // Init ticker view with your parameters
    ADTickerViewController *tickerView2 = [[ADTickerViewController alloc] initTickerWithFrame:CGRectMake(10, 200, 200, 40)
                                                                                  textString:text2
                                                                                    textFont:[UIFont boldSystemFontOfSize:22]
                                                                                   textColor:[UIColor yellowColor]
                                                                          andBackgrountColor:[UIColor redColor]];
                                                                          
  // Add it to your view
  [myView addSubview:tickerView2.view];



