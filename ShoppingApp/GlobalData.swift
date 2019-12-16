import Foundation

//Singleton class to store array of cart items:
class GlobalData
{
    
    static let sharedInstance = GlobalData()
    var shopping_cart_id = [Int]()
    var items = [[String]]()
    
    private init()
    {
        print("Singleton initialized")
        shopping_cart_id = []
        items = [[String]]()
    }
    
}
