//
//  HTTPClient.swift
//  YASA - Yet Another Service Architecture
//
//  Created by Tullio Sebastiani on 22/10/16.
//  Copyright © 2016 Tullio Sebastiani. All rights reserved.
//
import Foundation

class FoundationCLient {
    var config: ConcreteHTTPClientSettings?
    
    func setup(config: ConcreteHTTPClientSettings){
        self.config = config
    }
    
    /*
     questo attualmente non fa niente, è solo un segnaposto, qui dentro andra implementato l'url task o l'alamofire o qualsiasi cosa
     che chiami http e torni Data, ugualmente ConcreteHTTPClientSettings è un segnaposto della classe di configurazione della 
     libreria che si intende utilizzare
     */
    
    func query(callback: (_ data: Data?, _ error: Error?) -> ()) {
        callback(nil,nil)
    }
}
