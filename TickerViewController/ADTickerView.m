//
//  ADTickerViewController.m
//  TickerView
//
//  Created by Aditya Deshmane on 04/01/14.
//  Copyright (c) 2014 Aditya Deshmane. All rights reserved.
//

#import "ADTickerViewController.h"
#define HUGE_WIDTH_VALUE 1500


@implementation ADTickerViewController

+ (void)addTickerInView:(UIView*) viewForTicker
             textString:(NSString*) textString
               textFont:(UIFont*) font
              textColor:(UIColor*) textColor
     andBackgrountColor:(UIColor*) bgColor;
{
    
    //Clear previous text, to clear this remove previously added labels
    for(UIView *view in viewForTicker.subviews)
    {
        if([view isKindOfClass:[UILabel class]])
        {
            [view removeFromSuperview];
        }
    }
    
    //Remove all animation
    [viewForTicker.layer removeAllAnimations];
    
    //Labels for giving loop like effect
    UILabel *tickerTextLabelOne;
    UILabel *tickerTextLabelTwo;
    
    //Margin setup
    int textTopMargin;
    int textBottomMargin;
    int textLeftMargin;
    int textSpaceBetweenTickerLoop;
    
    //Animation speed
    int animationSpeed;//set Value in Range 1 to 10, less value more speed;
    
    //View setup
    [viewForTicker setClipsToBounds:YES];
    [viewForTicker setBackgroundColor:bgColor];
    
    //Label margins
    textTopMargin = textBottomMargin = textLeftMargin =  4;
    textSpaceBetweenTickerLoop = 20;
    animationSpeed = 4;
    
    
    //Label width calculation
    float expectedLabelWidth = 0;
    float requiredHeight = viewForTicker.frame.size.height- (textTopMargin+textBottomMargin) ;
    
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
    tickerTextLabelOne.textAlignment = NSTextAlignmentLeft;
    [tickerTextLabelOne setFont:font];
    [tickerTextLabelOne setTextColor:textColor];
    [tickerTextLabelOne setFrame:CGRectMake(textLeftMargin, textTopMargin, expectedLabelWidth, requiredHeight)];
    tickerTextLabelOne.text = textString;
    [tickerTextLabelOne setBackgroundColor:[UIColor clearColor]];
    
    [viewForTicker addSubview:tickerTextLabelOne];
    
    
    //If text string length is greater than frame width (whole text string is not visible in given frame widht), add ticker effect by adding one more label
    
    if(viewForTicker.frame.size.width < (textLeftMargin+expectedLabelWidth-2))
    {
        //Label Two setup
        tickerTextLabelTwo = [[UILabel alloc] init];
        tickerTextLabelTwo.textAlignment = NSTextAlignmentLeft;
        [tickerTextLabelTwo setFont:font];
        [tickerTextLabelTwo setTextColor:textColor];
        float xPos = textLeftMargin+expectedLabelWidth+textSpaceBetweenTickerLoop;
        [tickerTextLabelTwo setFrame:CGRectMake(xPos, textTopMargin, expectedLabelWidth, requiredHeight)];
        tickerTextLabelTwo.text = textString;
        [tickerTextLabelTwo setBackgroundColor:[UIColor clearColor]];
        
        [viewForTicker addSubview:tickerTextLabelTwo];
        
        
        /** ANIMATION **/
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

@end
