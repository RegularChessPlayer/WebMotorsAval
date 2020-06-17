//
//  Cars.swift
//  webmotors
//
//  Created by Thiago Souza on 15/06/20.
//  Copyright © 2020 Thiago Souza. All rights reserved.
//

struct Car: Decodable {
   
    let id: Int
    let make: String
    let model: String
    let version: String
    let image: String
    let km: Int
    let price: String
    let yearModel: Int
    let yearFab: Int
    let color: String
    
    enum CodingKeys: String, CodingKey {
      case id = "ID", make="Make", model="Model", version="Version", image="Image",
           km="KM", price="Price", yearModel="YearModel", yearFab="YearFab", color="Color"
    }
}

