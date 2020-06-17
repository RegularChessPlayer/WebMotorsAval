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
                titleCar.text = "Não Informado"
                return
        }
        titleCar.text = "\(make) \(model) Ano: \(yearModel) \(km) KM"
        detail.text = """
         Versão: \(version)
        
         Cor: \(color)
         Preço: \(price)
         Ano de Fabricação: \(yearFab)
        """
    }
    
}
