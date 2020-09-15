//
//  HomeController.swift
//  OptimalYolla
//
//  Created by Rufat on 9/7/20.
//  Copyright © 2020 Rufat. All rights reserved.
//

import UIKit
import WebKit
import MBProgressHUD
class HomeController: UIViewController,WKUIDelegate, WKNavigationDelegate {
    
    @IBOutlet weak var browser: WKWebView!
    var myURL:URL?
    var loadingAlert:MBProgressHUD?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        browser.navigationDelegate = self
               browser.uiDelegate = self
        // Do any additional setup after loading the view.
        myURL = URL(string:"https://optimalyolla.az/panelim-app/")
        let myRequest = URLRequest(url: myURL!)
        browser.load(myRequest)
        
        // Register to receive notification in your class
               NotificationCenter.default.addObserver(self, selector: #selector(self.showSpinningWheel(_:)), name: NSNotification.Name(rawValue: "notificationName"), object: nil)
    }
    // handle notification
     @objc func showSpinningWheel(_ notification: NSNotification) {
         print(notification.userInfo ?? "")
         if let dict = notification.userInfo as NSDictionary? {
             if let url = dict["url"] as? String{
                 // do something with your image
                 if url != ""{
                    myURL = URL(string: url)
                  let myRequest = URLRequest(url: myURL!)
                         browser.load(myRequest)
                    
                 }
             }
         }
     }
   func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
     let javascript = "document.title\n"
    browser.evaluateJavaScript(javascript) { (result, error) -> Void in
           if error == nil {
               self.title = String(describing: result!)
           }
       }
    loadingAlert?.hide(animated: true)
        
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
       loadingAlert = MBProgressHUD.showAdded(to: self.view, animated: true)
        loadingAlert!.mode = MBProgressHUDMode.indeterminate
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
       loadingAlert?.hide(animated: true)
    }
    
    @IBAction func menuClicked(_ sender: Any) {
           self.performSegue(withIdentifier: "menuSegue", sender: self)
    }
    //    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        //print("Selected item")
//        if let items = tabBar.items {
//            items.enumerated().forEach { if $1 == item {
//
//                // print("your index is: \($0)")
//                switch $0 {
//                case 0:
//                    myURL = URL(string:"https://optimalyolla.az/")
//                    let myRequest = URLRequest(url: myURL!)
//                    browser.load(myRequest)
//                case 1:
//                    myURL = URL(string:"https://optimalyolla.az/sifarislerim/")
//                    let myRequest = URLRequest(url: myURL!)
//                    browser.load(myRequest)
//                case 2:
//                    myURL = URL(string:"https://optimalyolla.az/yeni-sifaris/")
//                    let myRequest = URLRequest(url: myURL!)
//                    browser.load(myRequest)
//                case 3:
//                    myURL = URL(string:"https://optimalyolla.az/baglamalarim/")
//                    let myRequest = URLRequest(url: myURL!)
//                    browser.load(myRequest)
//                case 4:
//                    myURL = URL(string:"https://optimalyolla.az/profilim/")
//                    let myRequest = URLRequest(url: myURL!)
//                    browser.load(myRequest)
//
//                default:
//                    break
//                }
//
//                } }
//        }
//
//    }
    //    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    //
    //      }
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
////      Get the new view controller using segue.destination.
////      Pass the selected object to the new view controller.
//
//     }
     
    
}
