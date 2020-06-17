//
//  Extension.swift
//  webmotors
//
//  Created by Thiago Souza on 17/06/20.
//  Copyright © 2020 Thiago Souza. All rights reserved.
//

import UIKit

func localizedString(forKey key: String) -> String {
    var result = Bundle.main.localizedString(forKey: key, value: nil, table: nil)

    if result == key {
        result = Bundle.main.localizedString(forKey: key, value: nil, table: "Default")
    }
    return result
}
