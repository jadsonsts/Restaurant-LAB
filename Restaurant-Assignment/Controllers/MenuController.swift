//
//  MenuController.swift
//  Restaurant-Assignment
//
//  Created by Jadson on 10/05/22.
//

import Foundation

class MenuController {
    let baseURL = URL(string: "http://localhost:8090/")!
    
    
    func fetchCategories(completion: @escaping ([String]?) -> Void) {
        
        let categoryURL = baseURL.appendingPathComponent("categories")
        let task = URLSession.shared.dataTask(with: categoryURL) { data, response, error in
            
/*The categories endpoint will need to be decoded into a Categories object, and for that you'll need to create a JSONDecoder. Since data is an optional value, you'll you need to unwrap it before you can use the JSONDecoder to decode it. Once the data has been successfully decoded, call completion and pass in the categories property on the new Categories object. If any of these steps fail, call completion with nil. */
            
            
            if let data = data,
               let jsonDictionary = try? JSONSerialization.jsonObject(with: data) as? [String:Any],
               let categories = jsonDictionary["categories"] as? [String] {
                completion(categories)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
    
    func fetchMenuItems(forCategoty categoryName: String, completion: @escaping ([MenuItem]?) -> Void) {
        
        let initialMenuURL = baseURL.appendingPathComponent("menu")
        var components = URLComponents(url: initialMenuURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "category", value: categoryName)]
        let menuURL = components.url!
        let task = URLSession.shared.dataTask(with: menuURL) { data, response, error in
            //code
        }
        task.resume()
    }
    
    func submitOrder(forMenuIDs menuIds: [Int], completion: @escaping (Int?) -> Void){
        let orderURL = baseURL.appendingPathComponent("order")
        
        //First, need to modify the request's default type from a GET to a POST. Then, tell the server what kind of data will be sending—JSON.
        var request = URLRequest(url: orderURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //Store the array of menu IDs in JSON under the key menuIds”
        let data: [String:[Int]] = ["menuIds": menuIds]
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(data)
        //The data for a POST must be stored within the body of the request. Once that's in place, can create the URLSessionDataTask”
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            //code
        }
        task.resume()
    }
}
