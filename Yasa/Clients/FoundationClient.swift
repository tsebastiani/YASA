//
//  HTTPClient.swift
//  YASA - Yet Another Service Architecture
//
//  Created by Tullio Sebastiani on 22/10/16.
//  Copyright © 2016 Tullio Sebastiani. All rights reserved.
//
import Foundation

class FoundationCLient: Clienting {
    var config: ServiceSettings?
    var session: URLSession?
    
    func setup(config: ServiceSettings){
        self.config = config
        self.session = URLSession.shared
    }
    
    func query(callback: (_ data: Data?, _ error: Error?) -> ()) {
        print(config)
        
        
        
        callback(nil,nil)
    }
}
