//
//  ViewController.swift
//  ShoppingApp
//
//  Created by Anan Mallik on 16/12/2019.
//  Copyright © 2019 Deloitte. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //Declare and initialize empty arrays:
    var name_array = ["", "", "", "", "", "", "", "", "", "", "", "", ""]
    var quantity_array = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]
    var price_array = ["", "", "", "", "", "", "", "", "", "", "", "", ""]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
        
        
        //Add data to label:
        let name_item = cell.viewWithTag(2) as! UILabel
        let quantity_item = cell.viewWithTag(3) as! UILabel
        let price_item = cell.viewWithTag(5) as! UILabel

        name_item.text = name_array[indexPath.row]
        quantity_item.text = String(quantity_array[indexPath.row]) + " in stock"
        price_item.text = price_array[indexPath.row]
            
        return cell
        
    }
    
    //When row is clicked this is where data for detail view is stored in StandardUserDefaults:
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
        // Create the alert controller
        let alertController = UIAlertController(title: "Add to Cart", message: "Add this item to my cart?", preferredStyle: .alert)

        // Create the actions
        let okAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) {
            UIAlertAction in
            print("OK Pressed")
            
            //add id to singelton:
            GlobalData.sharedInstance.shopping_cart_id.append(indexPath.row)
            let item = [self.name_array[indexPath.row], String(self.quantity_array[indexPath.row]), self.price_array[indexPath.row]]
            GlobalData.sharedInstance.items.append(item)
            
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
    
    func addtoCart() {
        

        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
         return 13
     }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
           return 135
       }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addData()

    }
    
    

    //Add test data to arrays:
    func addData() {
        
        
        self.name_array[0] = "Almond Toe Shoes, Patent Black"
        self.name_array[1] = "Suede Shoes, Blue"
        self.name_array[2] = "Leather Driver Saddle Loafers, Tan"
        self.name_array[3] = "Flip Flops, Red"
        self.name_array[4] = "Flip Flops, Blue"
        self.name_array[5] = "Gold Button Cardigan, Black"
        self.name_array[6] = "Cotton Shorts, Medium Red"
        self.name_array[7] = "Fine Stripe Short Sleeve Shirt, Grey"
        self.name_array[8] = "Fine Stripe Short Sleeve Shirt, Green"
        self.name_array[9] = "Sharkskin Waistcoat, Charcoal"
        self.name_array[10] = "Lightweight Patch Pocket Blazer, Deer"
        self.name_array[11] = "Bird Print Dress, Black"
        self.name_array[12] = "Mid Twist Cut-Out Dress, Pink"
        

        self.quantity_array[0] = 5
        self.quantity_array[1] = 4
        self.quantity_array[2] = 12
        self.quantity_array[3] = 6
        self.quantity_array[4] = 0
        self.quantity_array[5] = 6
        self.quantity_array[6] = 5
        self.quantity_array[7] = 9
        self.quantity_array[8] = 3
        self.quantity_array[9] = 2
        self.quantity_array[10] = 1
        self.quantity_array[11] = 10
        self.quantity_array[12] = 5
        
        self.price_array[0] = "£99.00"
        self.price_array[1] = "£42.00"
        self.price_array[2] = "£34.00"
        self.price_array[3] = "£19.00"
        self.price_array[4] = "£19.00"
        self.price_array[5] = "£167.00"
        self.price_array[6] = "£30.00"
        self.price_array[7] = "£49.99"
        self.price_array[8] = "£39.99"
        self.price_array[9] = "£75.00"
        self.price_array[10] = "£175.00"
        self.price_array[11] = "£270.00"
        self.price_array[12] = "£540.00"
        
        
    }
}

