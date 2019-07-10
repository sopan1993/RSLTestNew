//
//  OrderDetailsVC.swift
//  RSLTest
//
//  Created by Kondya on 30/06/19.
//  Copyright © 2019 bitware. All rights reserved.
//

import UIKit

class OrderDetailsVC: UIViewController {

    @IBOutlet weak var imageRestaurant: UIImageView!
    @IBOutlet weak var lblRestaurantName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblDessertsName1: UILabel!
    @IBOutlet weak var lblDessertsName: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblOrderType: UILabel!
    @IBOutlet weak var lblOrderCode: UILabel!
    @IBOutlet weak var lblOrderStatus: UILabel!
    @IBOutlet weak var lblPaymentType: UILabel!
    @IBOutlet weak var lblServiceCharge: UILabel!
    @IBOutlet weak var lblTipAmount: UILabel!
    @IBOutlet weak var lblTotalCost: UILabel!
    
    
    var orderInfoModel:OrderInfoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setData()
        // Do any additional setup after loading the view.
    }
    
    func setData(){
        
        if let model = orderInfoModel {
            
            if let url = model.rSrc {
                self.imageRestaurant.downloadImageFromServerURL(urlString:url)
            }else{
                self.imageRestaurant.image = UIImage(named: "restaurant")
            }
            self.lblOrderStatus.text = model.oStatus
            self.lblAmount.text = "\(model.order.count) X \(model.rCurrency + model.oTAmount)"
            self.lblRestaurantName.text = model.rTitle
            self.lblAddress.text = model.rAddress
            self.lblDessertsName1.text = model.order.map { $0.mName }.joined(separator: ",")
            self.lblDessertsName.text = model.order.map { $0.miName }.joined(separator: ",")
            self.lblOrderType.text = model.oType
            self.lblOrderCode.text = model.orderId
            self.lblPaymentType.text = model.oPState
            self.lblServiceCharge.text = model.rCurrency + model.promotedPrice
            if  model.tipAmount.isEmpty {
                self.lblTipAmount.text = model.rCurrency + "0"
            }else{
                self.lblTipAmount.text = model.rCurrency + model.tipAmount
            }
            self.lblTotalCost.text = model.rCurrency + model.oVPrice
            
            
        }
        
    }
    
    
    @IBAction func btnPhoneClicked(_ sender: Any) {
        
        
    }
    
    @IBAction func btnLikeClicked(_ sender: Any) {
        
        
    }
    

}
