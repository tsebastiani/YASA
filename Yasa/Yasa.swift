//
//  Yasa.swift
//  Yasa
//
//  Created by Tullio Sebastiani on 25/10/2016.
//  Copyright © 2016 Tullio Sebastiani. All rights reserved.
//

import UIKit

public class Yasa: NSObject {
    
    public func login(username: String, password: String,callback:()->()){
        let loginserv: Service<LoginService,FoundationCLient> = Service(client:FoundationCLient(),
                                                       service: LoginService(),
                                                       mapper: LoginEntityMapper())
        var loginParams: LoginServiceParams = LoginServiceParams()
        loginParams.username = "tullio"
        loginParams.password = "secret"
        
        loginserv.query(params: loginParams) { (entity:LoginEntityMapper.GenericMappedEntity?, error:Error?) in
            guard let entity = entity, error == nil else {
                return
            }
            print(entity.name)
            print(entity.surname)
            print(entity.email)
            print(entity.address)
        }
        
    }

}
