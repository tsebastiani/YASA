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


class User {
    var name: String?
    var surname: String?
    var email: String?
    var address: String?
}

class LoginEntityMapper: EntityMapping {
    typealias GenericMappedEntity = User
    func map(data: Data) -> GenericMappedEntity? {
        return User()
    }
}

struct LoginServiceParams  {
    var username: String?
    var password: String?
}

class LoginService: ServiceConfiguring {
    
    /*
     Questa è la specializzazione degli associatedTypes in questo modo il compilatore segue tutta la catena passando per 
     le interfacce e sa cosa ritornare esattamente, questa torna la classe di configurazione per il client http, questa è una 
     classe concreta , sara tipo NSURLconfiguration o qualcosa del genere ma come vedi i parametri che tu gli passi dalla
     chiamata a query all'inizio, arrivano fino quaggiu, quindi ad esempio se devi fare il login, passi a query i parametri di login
     e poi qui li metti fisicamente nell'header della request
     */
    
    
    
    typealias GenericParams = LoginServiceParams
    typealias GenericMapper = LoginEntityMapper
    
    func getClientSettings(_ params: LoginServiceParams) -> ConcreteHTTPClientSettings {
        
        /*
         quji dentro sara contenuto anche l'url del servizio per il momento non facendo alcuna chiamata
         è solo un segnaposto
         */
        _ = "http://......" 
        
        print("configuro il client con username: \(params.username) password: \(params.password)")
        return ConcreteHTTPClientSettings()
    }

}

