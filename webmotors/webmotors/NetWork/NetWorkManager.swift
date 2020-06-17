//
//  NetWorkManager.swift
//  webmotors
//
//  Created by Thiago Souza on 15/06/20.
//  Copyright © 2020 Thiago Souza. All rights reserved.
//

import Alamofire
import AlamofireImage

class NetWorkManager {
    
    static let shared = NetWorkManager()
    private let baseUrl = "http://desafioonline.webmotors.com.br/api/OnlineChallenge"
    
    private init() {}

    func fetchCars(page:Int, sucessCallBack: @escaping(_ cars: [Car]) -> Void, errorCallBack: @escaping(_ error: Error) ->Void) {
        let url = URL(string: baseUrl + "/Vehicles?Page=\(page)")!
        AF.request(url).responseDecodable(of: Array<Car>.self) { (response) in
            if let responseError = response.error {
                return errorCallBack(responseError)
            }else{
                guard let cars = response.value else { return sucessCallBack([])}
                return sucessCallBack(cars)
            }
        }
    }
    
}
