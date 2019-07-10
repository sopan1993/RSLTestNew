//
//  Models.swift
//  RSLTest
//
//  Created by Shirish Vispute on 10/07/19.
//  Copyright © 2019 Shirish Vispute. All rights reserved.
//

import Foundation

// MARK: - OrderModel
struct OrderModel: Codable {
    let status, message, count: String
    let data: [OrderInfoModel]
}

// MARK: - OrderInfoModel
class OrderInfoModel: Codable {
    
    let rTitle: String
    let rSrc: String?
    let rAddress: String
    let oVPrice: String
    let oStatus: String
    let rCurrency: String
    let oDateAdded: String
    let oType: String
    let orderId: String
    let oPState: String
    let tipAmount: String
    let oTAmount: String
    let promotedPrice: String
    let order: [Order]
   
}
class Order: Codable{
    
    let miName: String
    let mName: String
    
}
