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

    func setup(config: ServiceSettings) {
        self.config = config
        self.session = URLSession.shared
    }

    func query(callback: @escaping (_ data: Data?, _ error: Error?) -> ()) {

        guard let url = config?.url, let method = config?.method else {
            callback(nil, MappingError())
            return
        }

        var request = URLRequest(url: url)

        switch method {
        case .get:
            request.httpMethod = "GET"
        case .post:
            request.httpMethod = "POST"
        }

        let task = session?.dataTask(with: request) {
            data, response, error in

            if error != nil {
                callback(nil, error)
                return
            }

            callback(data, nil)
        }

        task?.resume()

    }

}
