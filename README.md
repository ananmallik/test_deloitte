# test_deloitte
a quick version of the shopping cart app:

I have included the core function of adding items to the cart and removing them.
There is no networking to speed up performance. This would be some similar code from a previous project (including authentication):

    //Networking method here: (Use POST Method and Token in Body as data)
    func getJSON(completion: @escaping ([Dictionary<String, AnyObject>]) -> ()) {
        
        let json = "token=feca0f24c0724208ac102c17592243a1"
        let url = URL(string: SERVER_URL)!

        // create post request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        // insert json data to the request
        let data = (json.data(using: .utf8))! as Data
        request.httpBody = data

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                
                
                let art_content = (responseJSON["rows"] as? [Dictionary<String, AnyObject>])
                
                completion(art_content!)
                
            }
        }
        task.resume()
        
    }
    

    For adding items to cart simply click on the table and the same for removing items in the cart view.


    Let me know if you need more stuff :)

    Thanks!!

    Anan
