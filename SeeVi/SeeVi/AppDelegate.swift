//
//  AppDelegate.swift
//  SeeVi
//
//  Created by Ty Daniels on 4/10/17.
//  Copyright © 2017 Ty Daniels. All rights reserved.
//

import UIKit
import GoogleMaps
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let realm = try! Realm()
    var myUser: Results<SVUser> {
        get {
            return realm.objects(SVUser.self)
        }
    }
    var paymentMethods: Results<SVPaymentMethod> {
        get {
            return realm.objects(SVPaymentMethod.self)
        }
    }

    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Provide GMaps API with Key
        GMSServices.provideAPIKey("AIzaSyBw1J9FHIMHcAesv9ihKfBIfYd_H6tgL8Y")
        
        //If User Realm object is empty, create a new one.
        if myUser.count == 0 {
            seedUser()
        }
        
        setupMainTBController()
        
        return true
    }
    
    fileprivate func setupMainTBController() {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        let mainTabBarController = MainTabBarController()
        window?.rootViewController = mainTabBarController
        window?.makeKeyAndVisible()
    }
    
    // MARK: - Add spoofed user settings data
    fileprivate func seedUser() {
        let realmManager = AppDelegate().realm
        let thisUser = SVUser()
        
        //User data
        let imageData = UIImagePNGRepresentation(UIImage(named: "spoofed-image")!)! as NSData
        thisUser.profileImg = imageData
        thisUser.name = "Dave Chappelle"
        thisUser.email = "dave@dave.com"
        thisUser.passWord = "supersecret"
        thisUser.userDescription = "Seevi is literally my favorite app. Also, I like coffee."
        
        //Card data
        for _ in 0...1 {
            let method = SVPaymentMethod()
            method.cardNam = "Dave C."
            method.cardNumber = "0000 0000 0000 0000"
            method.cardDate = "02/12"
            method.cvvNum = "234"
            
            try! realmManager.write {() -> Void in
                realmManager.add(method)
            }
        }
        
        try! realmManager.write {() -> Void in
            realmManager.add(thisUser)
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

