//
//  MenuController.swift
//  OptimalYolla
//
//  Created by Rufat on 9/15/20.
//  Copyright © 2020 Rufat. All rights reserved.
//

import UIKit

class MenuController: UITableViewController {
    var menuList = Array<MenuStruct>()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        let managePanel:MenuStruct = MenuStruct()
        managePanel.ID=0
        managePanel.url = "https://optimalyolla.az/panelim-app/"
        managePanel.name="İdarə panelim"
        managePanel.icon = UIImage(named: "ic_navigation_settings")?.pngData()
        
        let newOrder:MenuStruct = MenuStruct()
        newOrder.ID=1
        newOrder.url = "https://optimalyolla.az/yeni-sifaris-app/"
        newOrder.name="Yeni sifariş"
        newOrder.icon  =  UIImage(named: "ic_navigation_offer")?.pngData()
        
        let checkOrder:MenuStruct = MenuStruct()
        checkOrder.ID=2
        checkOrder.url = "https://optimalyolla.az/baglama-izle-app/"
        checkOrder.name="Bağlama izlə"
        checkOrder.icon  =  UIImage(named: "ic_navigation_search")?.pngData()
        
        let myOrders:MenuStruct = MenuStruct()
        myOrders.ID=3
        myOrders.url = "https://optimalyolla.az/sifarislerim-app/"
        myOrders.name="Sifarişlərim"
        myOrders.icon  =  UIImage(named: "ic_navigation_shop")?.pngData()
        
        let myPackages:MenuStruct = MenuStruct()
        myPackages.ID=4
        myPackages.url = "https://optimalyolla.az/baglamalarim-app/"
        myPackages.name="Bağlamalarım"
        myPackages.icon  =  UIImage(named: "ic_navigation_shipping")?.pngData()
        
        let profile:MenuStruct = MenuStruct()
        profile.ID=5
        profile.url = "https://optimalyolla.az/profilim-app/"
        profile.name="Profilim"
        profile.icon  =  UIImage(named: "ic_navigation_user")?.pngData()
        let aboutUs:MenuStruct = MenuStruct()
        aboutUs.ID=5
        aboutUs.url = "https://optimalyolla.az/haqqimizda-app/"
        aboutUs.name="Şirkət haqqında"
        aboutUs.icon  =  UIImage(named: "ic_navigation_about")?.pngData()
        let contactUs:MenuStruct = MenuStruct()
        contactUs.ID=5
        contactUs.url = "https://optimalyolla.az/bizimle-elaqe-app/"
        contactUs.name="Bizimlə əlaqə"
        contactUs.icon  =  UIImage(named: "ic_navigation_contact")?.pngData()
        menuList.append(managePanel)
        menuList.append(newOrder)
        menuList.append(checkOrder)
        menuList.append(myOrders)
        menuList.append(myPackages)
        menuList.append(profile)
        menuList.append(aboutUs)
        menuList.append(contactUs)
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell")!
        do{
            // cell.imageView?.image = nil
            if menuList.count > 0{
                cell.imageView?.image = UIImage(data: menuList[indexPath.row].icon!)
                cell.textLabel?.text = menuList[indexPath.row].name
            }
            
            
            
        }
        catch
        {
            print(indexPath.row)
        }
        
        
        
        return cell
    }
    
    @IBAction func exitClicked(_ sender: Any) {
        
        dismiss(animated: true)
        
    }
        override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
     dismiss(animated: true)

            return indexPath
        }
    override func viewWillDisappear(_ animated: Bool) {
        
        var url = ""
        let selected_indexPaths = tableView.indexPathsForSelectedRows
        if selected_indexPaths != nil{
            
            
            for indexPath in selected_indexPaths! {
                url = menuList[indexPath.row].url!
                // values.append(interestList[indexPath.row])
                //print(interestList[indexPath.row].name!)
            }
            
        }
        else
        {
            //            var defaultInterest:Interest = Interest()
            //            defaultInterest.name = "Maraqlarınızı seçin..."
            //            defaultInterest.id = 0
            //            values.append(defaultInterest)
        }
        let imageDataDict:[String: String] = ["url": url]
        
        // post a notification
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notificationName"), object: nil, userInfo: imageDataDict)
        
    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
