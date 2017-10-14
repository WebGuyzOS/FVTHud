
//Developer - indrajit.chavda@gmail.com


import UIKit
class FVTHud:NSObject
{
    static var showNetworkIndicator:Bool = true
    static var hudContainderSize:CGFloat = 160
    static let disablerView:UIView={
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(white: 0, alpha: 0.15)
        return view
    }()
    static let hudContainder:UIImageView={
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 16
        view.backgroundColor = UIColor.init(white: 0.3, alpha: 0.5)
        return view
    }()
    static var loadingIndicator:UIActivityIndicatorView={
        let loading = UIActivityIndicatorView()
        loading.translatesAutoresizingMaskIntoConstraints = false
        loading.activityIndicatorViewStyle = .whiteLarge
        loading.backgroundColor = .clear
        loading.layer.cornerRadius = 16
        loading.layer.masksToBounds = true
        return loading
    }()
 
    static var hudTextsLabel:UILabel={
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Please wait..."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   fileprivate static var timerToHideHud:Timer?
   fileprivate static var timerToShowHud:Timer?
    
    @objc class func hideHudAfterDelay(timeInterval:Double){
        
        FVTHud.timerToShowHud?.invalidate()
        FVTHud.timerToHideHud = Timer.scheduledTimer(timeInterval: timeInterval, target: FVTHud.self, selector: #selector(FVTHud.hide), userInfo: nil, repeats: false)
        
    }
    
    @objc class func hide(){
      
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        FVTHud.loadingIndicator.stopAnimating()
        FVTHud.disablerView.removeFromSuperview()
        timerToHideHud?.invalidate()
        
    }
    
    
    class func showHudAfterDelay(timeInterval:Double,hudTexts:String = "Please wait...",conainerView:Any? = nil)
    {
        FVTHud.hudTextsLabel.text = hudTexts
        FVTHud.timerToHideHud?.invalidate()
        
        FVTHud.timerToShowHud = Timer.scheduledTimer(timeInterval: timeInterval, target: FVTHud.self, selector: #selector(FVTHud.showHudAfterDelayWithPatameter), userInfo: ["hudTexts":hudTexts,"view":conainerView], repeats: false)
    }
    
    @objc fileprivate static func showHudAfterDelayWithPatameter(timer:Timer){
        if let userInfo = timer.userInfo as? [String:Any]{
            var conainerView:UIView?
            if let value = userInfo["view"] as? UIView{
                conainerView = value
            }
            if let value = userInfo["hudTexts"] as? String{
                showHud(hudTexts: value, hudConainerView: conainerView)
            }
        }
    }
    
    @objc static func showHud(hudTexts:String = "Please wait...",hudConainerView:UIView? = nil){
        
        FVTHud.hudTextsLabel.text = hudTexts
        func setUpHudeViews(keyWindow:UIView){
            if !FVTHud.loadingIndicator.isAnimating
            {
                UIApplication.shared.isNetworkActivityIndicatorVisible = showNetworkIndicator
                keyWindow.addSubview(disablerView)
                
                disablerView.rightAnchor.constraint(equalTo: keyWindow.rightAnchor).isActive = true
                disablerView.leftAnchor.constraint(equalTo: keyWindow.leftAnchor).isActive = true
                disablerView.topAnchor.constraint(equalTo: keyWindow.topAnchor).isActive = true
                disablerView.bottomAnchor.constraint(equalTo: keyWindow.bottomAnchor).isActive = true
                FVTHud.loadingIndicator.startAnimating()
           
                disablerView.addSubview(hudContainder)
             
                hudContainder.centerXAnchor.constraint(equalTo: disablerView.centerXAnchor).isActive = true
                hudContainder.centerYAnchor.constraint(equalTo: disablerView.centerYAnchor).isActive = true
                hudContainder.widthAnchor.constraint(equalToConstant: hudContainderSize).isActive = true
                hudContainder.heightAnchor.constraint(equalToConstant: hudContainderSize).isActive = true
                
                hudContainder.addSubview(loadingIndicator)
                loadingIndicator.centerXAnchor.constraint(equalTo: hudContainder.centerXAnchor).isActive = true
                loadingIndicator.centerYAnchor.constraint(equalTo: hudContainder.centerYAnchor).isActive = true
                
                hudContainder.addSubview(hudTextsLabel)
                hudTextsLabel.rightAnchor.constraint(equalTo: hudContainder.rightAnchor, constant: -3).isActive = true
                hudTextsLabel.leftAnchor.constraint(equalTo: hudContainder.leftAnchor, constant: 3).isActive = true
                hudTextsLabel.topAnchor.constraint(equalTo: loadingIndicator.bottomAnchor, constant: 5).isActive = true
                hudTextsLabel.bottomAnchor.constraint(equalTo: hudContainder.bottomAnchor, constant: -5).isActive = true
          
            }
        }
        
        if let superView = hudConainerView{
            setUpHudeViews(keyWindow: superView)
        }else if let app = UIApplication.shared.delegate as? AppDelegate, let window = app.window,let keyWindow = window.rootViewController?.view {
            setUpHudeViews(keyWindow: keyWindow)
        }
    }
    
    
    
    
}

