//
//  Yasa.swift
//  Yasa
//
//  Created by Tullio Sebastiani on 25/10/2016.
//  Copyright © 2016 Tullio Sebastiani. All rights reserved.
//

import UIKit

public class Yasa: NSObject {
    
    public func login(username: String, password: String,callback: @escaping (_ user:User?,_ error:Error?)->()){
        let loginserv: Service<LoginService,FoundationCLient> = Service(client:FoundationCLient(),
                                                       service: LoginService(),
                                                       mapper: LoginEntityMapper())
        var loginParams: LoginServiceParams = LoginServiceParams()
        loginParams.username = username
        loginParams.password = password
        
        loginserv.query(params: loginParams) { (entity:LoginEntityMapper.GenericMappedEntity?, error:Error?) in
            guard let entity = entity, error == nil else {
                callback(nil,error)
                return
            }
            callback(entity,nil)
        }
        
    }
    
    
    public func getItems(store: String,callback: @escaping (_ user:[Item]?,_ error:Error?)->()){
        let loginserv: Service<ItemService,FoundationCLient> = Service(client:FoundationCLient(),
                                                                        service: ItemService(),
                                                                        mapper: ItemEntityMapper())
        var itemServiceParams: ItemServiceParams = ItemServiceParams()
        itemServiceParams.store = store
        
        loginserv.query(params: itemServiceParams) { (entity:ItemEntityMapper.GenericMappedEntity?, error:Error?) in
            guard let entity = entity, error == nil else {
                callback(nil,error)
                return
            }
            callback(entity,nil)
        }
        
    }

}
