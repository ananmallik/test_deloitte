//
//  CartViewController.swift
//  ShoppingApp
//
//  Created by Anan Mallik on 16/12/2019.
//  Copyright © 2019 Deloitte. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //Declare and initialize empty arrays:
    var name_array = [String]()
    var quantity_array = [String]()
    var price_array = [String]()
    

    override func viewDidLoad() {
        
        super.viewDidLoad()

        
        if(GlobalData.sharedInstance.shopping_cart_id.count == 0 ) {
            

        }
        else {
            
            
            addData()
        }
    }
    
    //add Data to table:
    func addData() {
        
        let count = GlobalData.sharedInstance.shopping_cart_id.count - 1
        
        for i in 0 ... count {
            name_array.append (GlobalData.sharedInstance.items[i][0])
            quantity_array.append (GlobalData.sharedInstance.items[i][1])
            price_array.append(GlobalData.sharedInstance.items[i][2])
        }
        
    }
    
    //When row is clicked this is where data for detail view is stored in StandardUserDefaults:
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
        // Create the alert controller
        let alertController = UIAlertController(title: "Delete", message: "Do you want to remove this item?", preferredStyle: .alert)

        // Create the actions
        let okAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) {
            UIAlertAction in
            print("OK Pressed")
            
            //remove element from singleton:
            GlobalData.sharedInstance.shopping_cart_id.remove(at: indexPath.row)
            GlobalData.sharedInstance.items.remove(at: indexPath.row)
            
            self.tableView.reloadData()
            
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            print("Cancel Pressed")
        }

        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)

        // Present the controller
        self.present(alertController, animated: true, completion: nil)
        
     }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
        
        
        //Add data to label:
        let name_item = cell.viewWithTag(2) as! UILabel
        let quantity_item = cell.viewWithTag(3) as! UILabel
        let price_item = cell.viewWithTag(5) as! UILabel

        name_item.text = name_array[indexPath.row]
        quantity_item.text = String(quantity_array[indexPath.row]) + " in stock"
        price_item.text = price_array[indexPath.row]
        
        let unit_price = price_array[indexPath.row].replacingOccurrences(of: "£", with: "", options: NSString.CompareOptions.literal, range:nil)
            
        return cell
        
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
         return GlobalData.sharedInstance.shopping_cart_id.count
     }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
           return 135
       }

    

}
