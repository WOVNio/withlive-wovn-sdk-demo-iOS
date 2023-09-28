//
//  AppDelegate.swift
//  BookStore
//
//  Created by Soojin Ro on 10/06/2019.
//  Copyright © 2019 Soojin Ro. All rights reserved.
//

import UIKit
import BookStoreKit
import WOVNswift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if ProcessInfo.processInfo.arguments.contains("-uitesting") {
            BookStoreConfiguration.shared.setBaseURL(URL(string: "http://localhost:8080")!)
        }
        print("WOVN SDK VERSION: \(Wovn.sdkVersion)")
        // Enable Wovn EventReporting feature
        Wovn.eventTypeReport()
        // Test allow report data. Do not hard code this in production
        Wovn.setPermission(permission: WovnPermission.all, enabled: true)
        // Change language
        Wovn.changeLang(langs: "ja", callback: { langResult in
            print("WOVN SDK ChangLang Result: \(langResult)")
        })
        return true
    }
}
