//
//  AppDelegate.m
//  Resurrection Church
//
// Created by Nate Hess on 10/18/15
//
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>
#import <TwitterKit/TwitterKit.h>

@import Firebase;
@import UserNotifications;

// Implement UNUserNotificationCenterDelegate to receive display notification via APNS for devices
// running ios 10 and above
@interface AppDelegate () <UNUserNotificationCenterDelegate>
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    //FABRIC FOR TWITTERKIT
    [Fabric with:@[[Twitter class]]];
    [Fabric with:@[[Crashlytics class]]];
    [[Fabric sharedSDK] setDebug: YES];
    [Fabric with:@[CrashlyticsKit]];
    
    //FIREBASE =======================================================
    [FIRApp configure];
    
    
    //TAB BAR COLOR ==================================================
    [[UIView appearance] setTintColor:[UIColor blackColor]];
    
    //PUSH NOTIFICATIONS =============================================
    
   
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

  

@end
