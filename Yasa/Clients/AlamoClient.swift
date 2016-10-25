//
//  AlamoClient.swift
//  Yasa
//
//  Created by Tullio Sebastiani on 25/10/2016.
//  Copyright © 2016 Tullio Sebastiani. All rights reserved.
//

import UIKit

class AlamoClient: Clienting {
    var config: ServiceSettings?
    
    func setup(config: ServiceSettings){
        self.config = config
    }
    
    func query(callback: (_ data: Data?, _ error: Error?) -> ()) {
        callback(nil,nil)
    }
}
