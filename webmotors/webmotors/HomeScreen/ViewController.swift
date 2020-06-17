//
//  ViewController.swift
//  webmotors
//
//  Created by Thiago Souza on 15/06/20.
//  Copyright © 2020 Thiago Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var page = 1
    var isLoadingList : Bool = true
    var cars: [Car] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fetchCars()
    }
    
    func fetchCars() {
        self.alertLoading()
        NetWorkManager.shared.fetchCars(page: page, sucessCallBack: { (cars) in
            self.cars += cars
            self.page += 1
            self.tableView.reloadData()
            self.isLoadingList = false
            self.dismiss(animated: false, completion: nil)
        }) { (error) in
            self.isLoadingList = false
            self.dismiss(animated: false, completion: nil)
            self.alertError(title: "Erro", message: error.localizedDescription)
        }
    }
    
    func alertLoading(){
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.large
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        DispatchQueue.main.async() {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func alertError(title: String, message: String) {
        let alert = UIAlertController(title:  title, message: message, preferredStyle:  .alert)
        let button = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(button)
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.cellIdentifier, for: indexPath) as? CarTableViewCell {
            let car = cars[indexPath.row]
            cell.configureCell(car: car)
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
        performSegue(withIdentifier: DetailViewController.mySegue, sender: indexPath.row)
    }
    
}

extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let position = sender as? Int, let detailVc = segue.destination as? DetailViewController else { return }
        detailVc.car = cars[position]
    }
}
