//
//  GenericService.swift
//  YASA - Yet Another Service Architecture
//
//  Created by Tullio Sebastiani on 22/10/16.
//  Copyright © 2016 Tullio Sebastiani. All rights reserved.
//
import Foundation
class Service<S: ServiceConfiguring, C: Clienting> {

    typealias GenericParams = S.GenericParams
    typealias GenericMapper = S.GenericMapper
    typealias GenericMappedEntity = GenericMapper.GenericMappedEntity

    var mapper: GenericMapper? = nil
    var service: S? = nil
    var client: C? = nil

    init(client: C, service: S, mapper: GenericMapper) {

        self.client = client
        self.service = service
        self.mapper = mapper
    }

    func query(params: GenericParams, callback: @escaping (_ mappedEntity: GenericMappedEntity?, _ error: Error?) -> ()) {
        guard let client = client, let service = service, let mapper = mapper else {
            return
        }
        client.setup(config: service.getClientSettings(params))
        client.query { (data: Data?, error: Error?) in

            guard let data = data, error == nil else {
                callback(nil, error)
                return
            }
            guard let mappedEntity: GenericMappedEntity = mapper.dataToEntity(data: data) else {
                callback(nil, MappingError())
                return
            }
            callback(mappedEntity, nil)

        }

    }

}

class MappingError: Error {

}
