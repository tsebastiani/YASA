//
//  MenuService.swift
//  YASA - Yet Another Service Architecture
//
//  Created by Tullio Sebastiani on 22/10/16.
//  Copyright © 2016 Tullio Sebastiani. All rights reserved.
//
import Foundation

public class Item {
    public var ID: String?
    public var Description: String?
    public var Price: String?
    public var Location: String?
}

class ItemEntityMapper: NSObject, EntityMapping, XMLParserDelegate {
    
    typealias GenericMappedEntity = [Item]
    var items = [Item]()
    var parser: XMLParser?
    
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        if elementName == "Element" {
            let item = Item()
            item.ID = attributeDict["ID"]
            item.Description = attributeDict["Description"]
            item.Location = attributeDict["Location"]
            item.Price = attributeDict["Price"]
            items.append(item)
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
    }
    
    func dataToEntity(data: Data) -> GenericMappedEntity? {
        parser = XMLParser(data: data)
        parser?.parse()
        return items
    }
    
    
    func entityToData(entity: [Item]?) -> Data? {
        return nil
    }
}


struct ItemServiceParams {
    var store: String?
}

class ItemService: ServiceConfiguring {

    typealias GenericMapper = ItemEntityMapper
    typealias GenericParams = ItemServiceParams
    
    func getClientSettings(_ params: GenericParams) -> ServiceSettings {
        
        var serviceSettings = ServiceSettings()
        serviceSettings.url = URL(string: "https://tsebastiani.github.io/items.xml")
        serviceSettings.method = .get
        return serviceSettings
    }

}


