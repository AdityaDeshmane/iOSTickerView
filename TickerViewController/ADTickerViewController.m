//
//  ADTickerViewController.m
//  TickerView
//
//  Created by Aditya Deshmane on 04/01/14.
//  Copyright (c) 2014 Aditya Deshmane. All rights reserved.
//

#import "ADTickerViewController.h"
#define HUGE_WIDTH_VALUE 1500

@interface ADTickerViewController ()
{
    //Labels for giving loop like effect
    UILabel *tickerTextLabelOne;
    UILabel *tickerTextLabelTwo;
    
    //Margin setup
    int textTopMargin;
    int textBottomMargin;
    int textLeftMargin;
    int textSpaceBetweenTickerLoop;
    
    //Animation speed
    int animationSpeed;
}

@end

@implementation ADTickerViewController

- (id)initTickerWithFrame:(CGRect) frame
               textString:(NSString*) textString
                 textFont:(UIFont*) font
                textColor:(UIColor*) textColor
       andBackgrountColor:(UIColor*) bgColor
{
    self = [super init];
    
    if (self)
    {
        //View setup
        [self.view setClipsToBounds:YES];
        [self.view setFrame:frame];
        [self.view setBackgroundColor:bgColor];
        
        //Label margins
        textTopMargin = textBottomMargin = textLeftMargin =  4;
        textSpaceBetweenTickerLoop = 20;
        
        
        //Label width calculation
        float expectedLabelWidth = 0;
        float requiredHeight = frame.size.height- (textTopMargin+textBottomMargin) ;
       
        if([textString respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)])//iOS 7
        {
            expectedLabelWidth= [textString boundingRectWithSize:CGSizeMake(HUGE_WIDTH_VALUE,requiredHeight)
                                                         options:NSStringDrawingUsesLineFragmentOrigin
                                                      attributes:@{NSFontAttributeName:font}
                                                         context:nil].size.width;
        }
        else//iOS 6 and below
        {
            CGSize constraintSize = CGSizeMake(HUGE_WIDTH_VALUE, requiredHeight);
            expectedLabelWidth = [textString sizeWithFont:font
                                        constrainedToSize:constraintSize
                                            lineBreakMode:UILineBreakModeWordWrap].width;
        }

        //Label One setup
        tickerTextLabelOne = [[UILabel alloc] init];
        [tickerTextLabelOne setFont:font];
        [tickerTextLabelOne setTextColor:textColor];
        [tickerTextLabelOne setFrame:CGRectMake(textLeftMargin, textTopMargin, expectedLabelWidth, requiredHeight)];
        tickerTextLabelOne.text = textString;
        [tickerTextLabelOne setBackgroundColor:[UIColor clearColor]];
        
        [self.view addSubview:tickerTextLabelOne];
        
        
        //If text string length is greater than frame width (whole text string is not visible in given frame widht), add ticker effect by adding one more label
        
        if(frame.size.width < (textLeftMargin+expectedLabelWidth-2))
        {
            //Label Two setup
            tickerTextLabelTwo = [[UILabel alloc] init];
            [tickerTextLabelTwo setFont:font];
            [tickerTextLabelTwo setTextColor:textColor];
            float xPos = textLeftMargin+expectedLabelWidth+textSpaceBetweenTickerLoop;
            [tickerTextLabelTwo setFrame:CGRectMake(xPos, textTopMargin, expectedLabelWidth, requiredHeight)];
            tickerTextLabelTwo.text = textString;
            [tickerTextLabelTwo setBackgroundColor:[UIColor clearColor]];
            
            [self.view addSubview:tickerTextLabelTwo];
            
            
            /** ANIMATION **/
            animationSpeed  = 4; //set Value in Range 1 to 10, less value more speed
            float animationDuratiton = (expectedLabelWidth/100) * animationSpeed;
            
            [UIView beginAnimations:@"Ticker" context:nil];
            [UIView setAnimationDuration:animationDuratiton];
            [UIView setAnimationRepeatCount: HUGE_VAL];
            
            CGRect rect = tickerTextLabelOne.frame;
            rect.origin.x = rect.origin.x - (tickerTextLabelOne.frame.size.width + textSpaceBetweenTickerLoop);
            tickerTextLabelOne.frame = rect;
            
            CGRect rectTwo = tickerTextLabelTwo.frame;
            rectTwo.origin.x = rectTwo.origin.x - (tickerTextLabelTwo.frame.size.width+ textSpaceBetweenTickerLoop);

            tickerTextLabelTwo.frame = rectTwo;
            [UIView commitAnimations];
        }
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
