//
//  AppDelegate.swift
//  NotificationListener
//
//  Created by Björn Fröhling on 10/11/2017.
//  Copyright © 2017 Frohling. All rights reserved.
//

import UIKit
import UserNotifications


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Register to receive remote notifications
    let options: UNAuthorizationOptions = [.alert, .sound]
    UNUserNotificationCenter.current().requestAuthorization(options: options) { (_, _) in
      application.registerForRemoteNotifications()
    }
    
    return true
  }
  
  func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    let token = deviceToken.reduce("") { $0 + String(format: "%02X", $1) }
    print(token)
  }
  
}
