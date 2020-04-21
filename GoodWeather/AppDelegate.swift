//
//  AppDelegate.swift
//  GoodWeather
//
//  Created by Serhan Khan on 20/04/2020.
//  Copyright © 2020 Serhan Khan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        if #available(iOS 13.0, *) {
              let navBarAppearance = UINavigationBarAppearance()
              navBarAppearance.configureWithOpaqueBackground()
              navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
              navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
              navBarAppearance.backgroundColor = UIColor(displayP3Red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
              UINavigationBar.appearance().standardAppearance = navBarAppearance
              UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
          }
          
         UIBarButtonItem.appearance().tintColor = UIColor.white

        
          UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
          
          
          UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        setupDefaultSettings()
        
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
    
    private func setupDefaultSettings() {
        let userDefaults = UserDefaults.standard
        if userDefaults.value(forKey: "Unit") == nil {
            userDefaults.set(Unit.fahrenheit.rawValue,forKey:"Unit")
        }
    }
}

