//
//  DetailViewController.swift
//  webmotors
//
//  Created by Thiago Souza on 17/06/20.
//  Copyright © 2020 Thiago Souza. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    static let mySegue = "infoSegue"
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleCar: UILabel!
    @IBOutlet weak var detail: UILabel!
    
    var car: Car?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()
        loadInfo()
    }
    
    func loadImage() {
        if let urlRequest = URL(string: car?.image ?? "") {
          image.af.setImage(withURL: urlRequest, placeholderImage: UIImage(named: "placeholder"))
        }else{
         image.image = UIImage(named: "placeholder_not_found")
      }
    }
    
    func loadInfo(){
        guard let make = car?.make, let model = car?.model, let version = car?.version,
            let km = car?.km, let price = car?.price, let yearModel = car?.yearModel,
            let yearFab = car?.yearFab, let color = car?.color else{
                titleCar.text = localizedString(forKey: "NOT_INFO")
                return
        }
        
        let YEAR = localizedString(forKey: "YEAR")
        let VERSION = localizedString(forKey: "VERSION")
        let COLOR = localizedString(forKey: "COLOR")
        let PRICE = localizedString(forKey: "PRICE")
        let FABYEAR = localizedString(forKey: "FAB_YEAR")
        
        titleCar.text = "\(make) \(model) \(YEAR): \(yearModel) \(km) KM"
        detail.text = """
         \(VERSION): \(version)
        
         \(COLOR): \(color)
         \(PRICE): \(price)
         \(FABYEAR): \(yearFab)
        """
    }
    
}
