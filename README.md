Ticker View
===========


##About 

><p>Common problem  with label or one liner text view, text string doesn't fit in required frame width and you dont have enough space to show it in multiline or can't increase width of label because you don't have that much space available.
><p> You need mechanism to show that string in given width, with text string running like animation (TICKER)

><p>This  is simple and small basic code which lets you achieve that functionality. 

## Where i can use it ?

>You can use (add as subview) it in any UIView or its subclass, like UITableViewCell, UIImageView etc.







How to use ?
-------------

>
* Add following view controller's files to your project 

   >>A. ADTickerViewController.h
   
   >>B. ADTickerViewController.m

>* How to use above classes 
   
   Sample code :
   
   >NSString *text2 = @"Message bigger length than frame.."; //This is your text string

  > // Init ticker view with your parameters
   
   ><pre><code> ADTickerViewController *tickerView2 = [[ADTickerViewController alloc] initTickerWithFrame:CGRectMake(10, 200, 200, 40)
                                                                                  textString:text2
                                                                                    textFont:[UIFont boldSystemFontOfSize:22]
                                                                                   textColor:[UIColor yellowColor]
                                                                          andBackgrountColor:[UIColor redColor]];</code></pre>
                                                                          
  >// Add it to your view
  
  ><pre><code> [myView addSubview:tickerView2.view];</code></pre>

##Other Info : 


><li>Works for : iOS 4 and above</li>

><li>Uses ARC : Yes</li>

><li>Xcode : 4 and above (Developed using 5.0.1)</li>

><li>Base SDK : 7.0 (Setting lower will aslo work)</li>

><li>Uses storybord/xib ? : Ticker View created programmatically, will work with both storybord or xib based project</li>




