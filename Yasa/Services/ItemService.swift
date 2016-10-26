//
//  MenuService.swift
//  YASA - Yet Another Service Architecture
//
//  Created by Tullio Sebastiani on 22/10/16.
//  Copyright © 2016 Tullio Sebastiani. All rights reserved.
//
import Foundation

public struct Item {
    public var ID: String?
    public var Description: String?
    public var Price: String?
    public var Location: String?
}

class ItemEntityMapper: NSObject, EntityMapping, XMLParserDelegate {
    
    typealias GenericMappedEntity = [Item]
    var items = [Item]()
    var parser: XMLParser?
    var element: Item?
    var currentElement: String?
    var foundContent:String?
    
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        
        if elementName == "Element" {
            if let element = element  {
                items.append(element)
            }
            element = Item()
        }
        

        
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "ID" {
            if let string = foundContent {
                element?.ID = string
            }
            
        }
        
        if elementName == "Description" {
            if let string = foundContent {
                element?.Description = string
            }
            
        }
        if elementName == "Price" {
            if let string = foundContent {
                element?.Price = string
            }
            
        }
        if elementName == "Location" {
            if let string = foundContent {
                element?.Location = string
            }
            
        }
        
        print(foundContent)
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        foundContent = string
    }
    
    func dataToEntity(data: Data) -> GenericMappedEntity? {
        parser = XMLParser(data: data)
        parser?.delegate = self
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


