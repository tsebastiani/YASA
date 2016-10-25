//
//  MenuService.swift
//  YASA - Yet Another Service Architecture
//
//  Created by Tullio Sebastiani on 22/10/16.
//  Copyright © 2016 Tullio Sebastiani. All rights reserved.
//
/*import Foundation

class MenuItem {
    var title: String?
}

class MenuEntityMapper: EntityMapping {
    typealias GenericMappedEntity = [MenuItem]
    func map(data: Data) -> GenericMappedEntity? {
        /*
         Come vedi questo mapper torna un array  di entities e quell'altro (LoginMapper nel file loginService) torna un'entity ma il entrambi i valori di ritorno sono mascherati da GenericMappedEntity in questo modo la stessa callback tornerà un array o un oggetto a seconda della specializzazione del servizio....questa è la cosa più figa di questi generics 😉
         */
        
        return [MenuItem]()
    }
}

struct MenuServiceParams {
    var menuItem: String?
}

class MenuService: ServiceConfiguring {
    /*
     Questa è la specializzazione degli associatedTypes in questo modo il compilatore segue tutta la catena passando per
     le interfacce e sa cosa ritornare esattamente
     */
    
    typealias GenericMapper = MenuEntityMapper
    typealias GenericParams = MenuServiceParams
    
    func getClientSettings(_ params: MenuServiceParams) -> ConcreteHTTPClientSettings {
        
        /*
         quji dentro sara contenuto anche l'url del servizio per il momento non facendo alcuna chiamata
         è solo un segnaposto
         */
        _ = "http://......"
        
        
        print("configuro il client con menuitem: \(params.menuItem)")
        return ConcreteHTTPClientSettings()
    }

}*/
