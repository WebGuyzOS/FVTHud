
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewToShowHud: UIView!
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        //        FVTHud.showHudAfterDelay(timeInterval: 1) // Covers full screen of the mobile and disables user interaction after 1 second
        //        FVTHud.showHud(hudTexts: "Loading...") // Covers full screen of the mobile and disables user interaction and changes the loading text, Default text is - "Please wait..."
        //
        //        FVTHud.showHud(hudConainerView: self.view) // Instead of covering full screen , It will cover only needed aread or view
        //        FVTHud.showHud(hudTexts: "Loading...", hudConainerView: viewToShowHud)
        //
        //        FVTHud.showHudAfterDelay(timeInterval: 1, hudTexts: "Loading...", conainerView:viewToShowHud)
        
        
        
        FVTHud.showHud() // Covers full screen of the mobile and disables user interaction
        
        //  FVTHud.hide()
        // FVTHud.hideHudAfterDelay(timeInterval: 10)
        
    }
    
    
    
    
    
    
    
}

