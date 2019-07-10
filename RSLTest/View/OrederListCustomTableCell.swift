//
//  OrederListCustomTableCell.swift
//  RSLTest
//
//  Created by Kondya on 30/06/19.
//  Copyright © 2019 bitware. All rights reserved.
//

import UIKit

class OrederListCustomTableCell: UITableViewCell {

    @IBOutlet weak var imgRestaurant: UIImageView!
    @IBOutlet weak var lblRestaurantName: UILabel!
    @IBOutlet weak var lblOrderStatus: UILabel!
    @IBOutlet weak var lblOrderDate: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    

    func setModel(model:OrderInfoModel) {
        
        self.lblRestaurantName.text = model.rTitle
        if let url = model.rSrc {
             self.imgRestaurant.imageFromServerURL(urlString:url)
        }else{
            self.imgRestaurant.image = UIImage(named: "restaurant")
        }
        self.imgRestaurant.layer.cornerRadius = self.imgRestaurant.frame.height/2
        self.lblOrderStatus.text = model.oStatus
        self.lblOrderDate.text = model.oDateAdded
        self.lblAmount.text = model.rCurrency + model.oVPrice
    
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
