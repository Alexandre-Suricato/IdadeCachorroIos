//
//  AppDelegate.swift
//  IdadeCachorroIos
//
//  Created by Alexandre Lima on 14/08/20.
//  Copyright © 2020 Alexandre Lima. All rights reserved.
//

import UIKit
import Beagle
import BeagleSchema

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        
        BeagleConfig.config()
        
        let remoteScreen = BeagleScreenViewController(.remote(.init(url: "http://localhost:8080/screen")))
        
        window?.rootViewController = remoteScreen
        window?.makeKeyAndVisible()
        
        return true
    }
}

