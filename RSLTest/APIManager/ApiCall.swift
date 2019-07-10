//
//  File.swift
//  RSLTest
//
//  Created by Kondya on 30/06/19.
//  Copyright © 2019 bitware. All rights reserved.
//

import Foundation


let baseUrl = "http://35.177.28.200/api_service/"

class ApiCall {
    
   
    func getUserOrderHistory(user_id: String,_ completion: @escaping (OrderModel) -> ()) {
        
        let json: [String: Any] = ["tuser_id": user_id]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        guard let url = URL(string:  baseUrl+"app/getOrders") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
           
            do {
                // Decode data to object
                let jsonDecoder = JSONDecoder()
                let orderModel = try jsonDecoder.decode(OrderModel.self, from: data)
                completion(orderModel)
            }
            catch {
                print("Error\(error)")
            }
        }
        task.resume()
    }
   
    
}
