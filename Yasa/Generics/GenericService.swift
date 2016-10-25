//
//  GenericService.swift
//  YASA - Yet Another Service Architecture
//
//  Created by Tullio Sebastiani on 22/10/16.
//  Copyright © 2016 Tullio Sebastiani. All rights reserved.
//
import Foundation
class Service<T: ServiceConfiguring>{
    
    typealias GenericParams = T.GenericParams
    typealias GenericMapper = T.GenericMapper
    typealias GenericMappedEntity = GenericMapper.GenericMappedEntity
    
    var client: FoundationCLient? = nil
    var service: T? = nil
    var mapper: GenericMapper? = nil
    
    init(client: FoundationCLient, service: T, mapper: GenericMapper){
        self.client = client
        self.service = service
        self.mapper = mapper
    }
    
    /*
     Questa è l'implementazione del flusso di un service generico, query -> map -> callback
     */
    
    
    func query(params: GenericParams, callback: (_ mappedEntity: GenericMappedEntity?,_ error: Error?) -> ()) {
        guard let client = client, let service = service, let mapper = mapper else {
            return
        }
        client.setup(config: service.getClientSettings(params))
        client.query { (data: Data?, error: Error?) in
            
            guard let data = data, error != nil else {
                callback(nil,error)
                return
            }
            guard let mappedEntity: GenericMappedEntity = mapper.map(data: data) else {
                callback(nil, MappingError())
                return
            }
            callback(mappedEntity,nil)
            
            
        }
        
        
    }
    
}

class MappingError: Error {
    
}
