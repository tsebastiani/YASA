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

protocol Servicing {
    associatedtype GenericParams
    associatedtype GenericMapper: EntityMapping
    func getClientSettings(_: GenericParams) -> ConcreteHTTPClientSettings
}

