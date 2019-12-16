import Foundation

//Singleton class to store Dictionary of Items:
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
