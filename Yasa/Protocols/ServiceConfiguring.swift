//
//  Service.swift
//  YASA - Yet Another Service Architecture
//
//  Created by Tullio Sebastiani on 22/10/16.
//  Copyright © 2016 Tullio Sebastiani. All rights reserved.
//

/*
 associatedTypes sono la figata piu grande del mondo  dichiari un tipo segnaposto tipo GenericParams, e poi lo specifichi
 nell'implementazione tramite un typealias in questo modo rimane tutto generico!!!
 */

protocol ServiceConfiguring {
    associatedtype GenericParams
    associatedtype GenericMapper: EntityMapping
    func getClientSettings(_: GenericParams) -> ServiceSettings
}

enum HTTPMethod {
    case get
    case post
    case put
    case delete
}

struct ServiceSettings {
    var method: HTTPMethod?
    var url: URL?
    var body: String?
}
