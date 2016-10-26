//
//  LoginService.swift
//  YASA - Yet Another Service Architecture
//
//  Created by Tullio Sebastiani on 22/10/16.
//  Copyright © 2016 Tullio Sebastiani. All rights reserved.
//
/*
 Se tu volessi implementare un altro servizio basterebbe fare un copia incolla di questa classe definendo params, mapper e service
 ed il gioco è fatto,
 */


import Foundation


public struct User {
    public var name: String?
    public var surname: String?
    public var email: String?
    public var address: String?
}

struct LoginServiceParams  {
    var username: String?
    var password: String?
}



class LoginEntityMapper: EntityMapping {
    typealias GenericMappedEntity = User
    func dataToEntity(data: Data) -> GenericMappedEntity? {
        do {
            guard let object = try JSONSerialization.jsonObject(with: data, options:.allowFragments) as? Dictionary <String,Dictionary<String,String>> else {
                return nil
            }
            var user = User()
            
            user.name = object["user"]?["name"]
            user.surname = object["user"]?["surname"]
            user.address = object["user"]?["address"]
            user.email = object["user"]?["email"]
    
            return user
        } catch {
            return nil
        }
        

    }
    func entityToData(entity: User?) -> Data? {
        return nil
    }
}


class LoginService: ServiceConfiguring {
    
    typealias GenericParams = LoginServiceParams
    typealias GenericMapper = LoginEntityMapper
    
    func getClientSettings(_ params: LoginServiceParams) -> ServiceSettings {
        var serviceSettings = ServiceSettings()
        serviceSettings.url = URL(string: "https://tsebastiani.github.io/user.json")
        serviceSettings.method = .get
        return serviceSettings
    }

}

