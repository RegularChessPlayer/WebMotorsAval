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
    @IBOutlet weak var innerView: UIView!
    
    @IBInspectable var cornerRadius: CGFloat = 5.0
    @IBInspectable var borderColor: CGColor = UIColor.clear.cgColor
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 3
    @IBInspectable var shadowColor: UIColor? = UIColor.white
    @IBInspectable var shadowOpacity: Float = 0.5

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func layoutSubviews() {
        innerView.layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        innerView.layer.masksToBounds = false
        innerView.layer.shadowColor = shadowColor?.cgColor
        innerView.layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        innerView.layer.shadowOpacity = shadowOpacity
        innerView.layer.shadowPath = shadowPath.cgPath
        innerView.layer.borderWidth = 1.0
        innerView.layer.borderColor = UIColor(red:192.0/255.0, green:57.0/255.0, blue:43.0/255.0, alpha:1.0).cgColor
    }
    
   func configureCell(car: Car){
      if let urlRequest = URL(string: car.image) {
          imageCar.af.setImage(withURL: urlRequest, placeholderImage: UIImage(named: "placeholder"))
      }else{
         imageCar.image = UIImage(named: "placeholder_not_found")
      }
      price.text = car.price
      model.text = "\(car.make) \(car.model) \(car.yearFab) \(car.km) KM"
      detail.text = car.version
    }

}
