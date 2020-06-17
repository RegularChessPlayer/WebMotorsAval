//
//  TableViewCell.swift
//  webmotors
//
//  Created by Thiago Souza on 16/06/20.
//  Copyright © 2020 Thiago Souza. All rights reserved.
//

import UIKit

class CarTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "carCell"
    
    @IBOutlet weak var imageCar: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var yearFab: UILabel!
    @IBOutlet weak var version: UILabel!
    @IBOutlet weak var status: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   func configureCell(car: Car){
      if let urlRequest = URL(string: car.image) {
          imageCar.af.setImage(withURL: urlRequest, placeholderImage: UIImage(named: "placeholder"))
      }else{
         imageCar.image = UIImage(named: "placeholder_not_found")
      }
      yearFab.text = "Ano: \(car.yearFab)"
      price.text = "R$: \(car.price)"
      model.text = car.model
      detail.text = "\(car.km) KM"
      version.text = car.version
    }

}
