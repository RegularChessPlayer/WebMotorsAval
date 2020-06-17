//
//  ViewController.swift
//  webmotors
//
//  Created by Thiago Souza on 15/06/20.
//  Copyright © 2020 Thiago Souza. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var page = 1
    var isLoadingList : Bool = false
    var cars: [Car] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fetchCars()
    }
    
    func fetchCars() {
        AF.request("http://desafioonline.webmotors.com.br/api/OnlineChallenge/Vehicles?Page=\(page)")
          .validate()
          .responseDecodable(of: Array<Car>.self) { (response) in
             guard let cars = response.value else { return }
             self.cars += cars
             self.page += 1
             self.tableView.reloadData()
             self.isLoadingList = false
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.cellIdentifier, for: indexPath) as? CarTableViewCell {

            let car = cars[indexPath.row]
            if let urlRequest = URL(string: car.image) {
                let placeholderImage = UIImage(named: "placeholder")!
                cell.imageCar.af.setImage(withURL: urlRequest, placeholderImage: placeholderImage)
            }else{
                let placeholderNotFound = UIImage(named: "placeholder_not_found")!
                cell.imageCar.image = placeholderNotFound
            }
            
            cell.yearFab.text = "Ano: \(car.yearFab)"
            cell.price.text = "R$: \(car.price)"
            cell.model.text = car.model
            cell.detail.text = "\(car.km) KM"
            cell.version.text = car.version
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height ) && !isLoadingList){
            self.isLoadingList = true
            self.fetchCars()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let car = cars[indexPath.row]
        print("Touch in \(car.model)")
    }
}
