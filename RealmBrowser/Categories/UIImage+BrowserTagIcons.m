//
//  UIImage+BrowserTagIcons.m
//  RealmBrowser
//
//  Created by Tim Oliver on 4/12/16.
//  Copyright © 2016 Tim Oliver. All rights reserved.
//

#import "UIImage+BrowserTagIcons.h"

@implementation UIImage (BrowserTagIcons)

+ (UIImage *)RLMBrowser_optionalTagIcon
{
    UIImage *image = nil;
    
    UIGraphicsBeginImageContextWithOptions((CGSize){53, 15}, NO, 0.0f);
    {
        //// General Declarations
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        //// Color Declarations
        UIColor* indexColor = [UIColor colorWithRed: 0.224 green: 0.267 blue: 0.498 alpha: 1];
        
        //// Rectangle Drawing
        UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, -0, 53, 15) cornerRadius: 7.5];
        [indexColor setFill];
        [rectanglePath fill];
        
        
        //// Text Drawing
        CGRect textRect = CGRectMake(6, 1, 41, 13);
        {
            NSString* textContent = @"Optional";
            NSMutableParagraphStyle* textStyle = [[NSMutableParagraphStyle alloc] init];
            textStyle.alignment = NSTextAlignmentCenter;
            NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: 10], NSForegroundColorAttributeName: UIColor.whiteColor, NSParagraphStyleAttributeName: textStyle};
            
            CGFloat textTextHeight = [textContent boundingRectWithSize: CGSizeMake(textRect.size.width, INFINITY) options: NSStringDrawingUsesLineFragmentOrigin attributes: textFontAttributes context: nil].size.height;
            CGContextSaveGState(context);
            CGContextClipToRect(context, textRect);
            [textContent drawInRect: CGRectMake(CGRectGetMinX(textRect), CGRectGetMinY(textRect) + (textRect.size.height - textTextHeight) / 2, textRect.size.width, textTextHeight) withAttributes: textFontAttributes];
            CGContextRestoreGState(context);
        }

        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)RLMBrowser_indexedTagIcon
{
    UIImage *image = nil;
    
    UIGraphicsBeginImageContextWithOptions((CGSize){51, 15}, NO, 0.0f);
    {
        //// General Declarations
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        //// Color Declarations
        UIColor* color = [UIColor colorWithRed: 0.941 green: 0.271 blue: 0.573 alpha: 1];
        
        //// Rectangle Drawing
        UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, 0, 51, 15) cornerRadius: 7.5];
        [color setFill];
        [rectanglePath fill];
        
        
        //// Text Drawing
        CGRect textRect = CGRectMake(6, 1, 38, 13);
        {
            NSString* textContent = @"Indexed";
            NSMutableParagraphStyle* textStyle = [[NSMutableParagraphStyle alloc] init];
            textStyle.alignment = NSTextAlignmentCenter;
            NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: 10], NSForegroundColorAttributeName: UIColor.whiteColor, NSParagraphStyleAttributeName: textStyle};
            
            CGFloat textTextHeight = [textContent boundingRectWithSize: CGSizeMake(textRect.size.width, INFINITY) options: NSStringDrawingUsesLineFragmentOrigin attributes: textFontAttributes context: nil].size.height;
            CGContextSaveGState(context);
            CGContextClipToRect(context, textRect);
            [textContent drawInRect: CGRectMake(CGRectGetMinX(textRect), CGRectGetMinY(textRect) + (textRect.size.height - textTextHeight) / 2, textRect.size.width, textTextHeight) withAttributes: textFontAttributes];
            CGContextRestoreGState(context);
        }

        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    
    return image;
}

@end
