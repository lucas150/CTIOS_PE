//
//  AppDelegate.swift
//  CTIOS_PE
//
//  Created by Henil Gandhi on 25/07/25.
//

import UIKit
import CleverTapSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    
    
    
    // Primitive types

    



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        CleverTap.autoIntegrate()
        registerForPush()
        CleverTap.setDebugLevel(CleverTapLogLevel.debug.rawValue)
        
        
        
        
     
        
        
        
        
        
        
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
    
    
    func registerForPush() {
        // Register for Push notifications
        UNUserNotificationCenter.current().delegate = self
        // request Permissions
        UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .badge, .alert], completionHandler: {granted, error in
            if granted {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        })
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: (UNNotificationPresentationOptions) -> Void) {
         CleverTap.sharedInstance()?.handleNotification(withData: notification.request.content.userInfo, openDeepLinksInForeground: false)
//        CleverTap.sharedInstance()?.recordNotificationViewedEvent(withData: notification.request.content.userInfo)

         completionHandler([.badge, .sound, .alert])
    }
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        
        NSLog("%@: did receive notification response: %@", self.description, response.notification.request.content.userInfo)
        completionHandler()
    }


}

