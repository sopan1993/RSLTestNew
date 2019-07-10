//
//  ViewController.swift
//  RSLTest
//
//  Created by Shirish Vispute on 10/07/19.
//  Copyright © 2019 Shirish Vispute. All rights reserved.
//

import UIKit

class OrderHistoryListVC: UIViewController {

    
    @IBOutlet weak var tblOrderList: UITableView!
    
    var orderInfoModelArray:[OrderInfoModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblOrderList.dataSource = self
        tblOrderList.delegate = self
        
        self.view.activityStartAnimating(activityColor: .darkGray, backgroundColor: .white)
        ApiCall().getUserOrderHistory(user_id: "578") { (orderModel) in
           
            self.orderInfoModelArray = []
            self.orderInfoModelArray.append(contentsOf: orderModel.data)
            DispatchQueue.main.async {
                self.tblOrderList.reloadData()
                self.view.activityStopAnimating()
            }
            
        }
    
    }


}

extension OrderHistoryListVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderInfoModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = self.tblOrderList.dequeueReusableCell(withIdentifier: "OrederListCustomTableCell", for: indexPath) as! OrederListCustomTableCell
        cell.setModel(model: self.orderInfoModelArray[indexPath.row])
        return cell
    }
}

extension OrderHistoryListVC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "OrderDetailsVC") as? OrderDetailsVC {
            vc.orderInfoModel = self.orderInfoModelArray[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}
