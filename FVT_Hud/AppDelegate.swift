

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FVTHud.showNetworkIndicator = true // By default its true, At the top or on the status bar there is default network indicator
        
        FVTHud.hudContainderSize = 130  // By default its 160 , Size of container which holds all stuff
        
        FVTHud.disablerView.backgroundColor = UIColor.init(white: 0.5, alpha: 0.5) // Covers hud conainer do disable the user interaction
        
        FVTHud.hudContainder.backgroundColor = .lightGray // Background color of entire hud
        
        //  FVTHud.hudContainder.image = UIImage(named:"image") // your desired image , By default it is nil,Background image of entire hud
        
        FVTHud.loadingIndicator.activityIndicatorViewStyle = .whiteLarge // By default its whiteLarge
        
        FVTHud.hudTextsLabel.isHidden = false // Hide "please wait" text if not needed
        
        FVTHud.rotationRoundBackground.backgroundColor = .clear // This is the view which is containing the rotating line
        
        FVTHud.rotationLineWidth = 3 // line which is rotating
        
        FVTHud.rotaionGapPercentage = 90  // The gap which appears in round rotating line
        
        FVTHud.rotationSpeedTime = 1.5 // Speed or time interval of rotation
        
        FVTHud.rotationSizeRatio = 2 // This is the size ration of round rotating line, By default it is half of total hud size that is hudContainderSize
        
        FVTHud.rotationLineColor = .black // Color of rotating line
        
        FVTHud.rotationLineGapColor = .clear  // Color of the gap which appears in round rotating line
        
        FVTHud.hudTextsLabel.font = UIFont.systemFont(ofSize: 14) // Font of text which tells "Please wait..."
        
        
        return true
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

