//
//  AppDelegate.m
//  RTUsefulExtension
//
//  Created by ricky on 13-4-27.
//  Copyright (c) 2013年 ricky. All rights reserved.
//

#import "AppDelegate.h"
#import "UIColor+RExtension.h"
#import "NSData+RExtension.h"
#import "NSString+RExtension.h"
#import "NSDate+RExtension.h"
#import "UIApplication+RExtension.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UIColor *color = [UIColor colorWithRed:0.6
                                     green:0.5
                                      blue:0.8
                                     alpha:1.0];
    UILabel *label = nil;
    
    for (int i=0; i<=4; i++) {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20 * i, 48, 20)];
        label.backgroundColor = [color colorByLighting:-0.2*(5-i)];
        label.text = @"text";
        [self.window addSubview:label];
    }
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 64, 20)];
    label.backgroundColor = color;
    label.text = @"text";
    [self.window addSubview:label];
    
    for (int i=1; i<=3; i++) {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20 * (i+5), 48, 20)];
        label.backgroundColor = [color colorByLighting:0.2*i];
        label.text = @"text";
        [self.window addSubview:label];
    }
    
    NSString *string = @"I Love China!";
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 160, 320, 20)];
    label.text = [NSString stringWithFormat:@"origin string: %@",string];
    label.font = [UIFont systemFontOfSize:14];
    [self.window addSubview:label];
    
    NSString *base64String = [[NSData dataWithBytes:string.UTF8String
                                             length:string.length] base64EncodedString];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 180, 320, 20)];
    label.text = [NSString stringWithFormat:@"base64 encode: %@",base64String];
    label.font = [UIFont systemFontOfSize:14];
    [self.window addSubview:label];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, 320, 20)];
    NSData *data = [base64String base64DecodedData];
    ;
    label.text = [NSString stringWithFormat:@"base64 decode: %@",[[[NSString alloc] initWithData:data
                                                                                        encoding:NSUTF8StringEncoding] autorelease]];
    label.font = [UIFont systemFontOfSize:14];
    [self.window addSubview:label];
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:-3420];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 240, 320, 20)];
    label.text = [NSString stringWithFormat:@"date: %@",[date stringWithFormat:@"YYYY-MM-dd HH:mm:ss"]];
    label.font = [UIFont systemFontOfSize:14];
    [self.window addSubview:label];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 260, 320, 20)];
    label.text = [NSString stringWithFormat:@"human preferred date: %@",[date humanPreferredTimeString]];
    label.font = [UIFont systemFontOfSize:14];
    [self.window addSubview:label];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 280, 320, 20)];
    label.text = [NSString stringWithFormat:@"app bundle: %@",[application appBundleID]];
    label.font = [UIFont systemFontOfSize:14];
    [self.window addSubview:label];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 300, 320, 20)];
    label.text = [NSString stringWithFormat:@"app version: %@",[application appVersion]];
    label.font = [UIFont systemFontOfSize:14];
    [self.window addSubview:label];
    
    return YES;
}

@end
