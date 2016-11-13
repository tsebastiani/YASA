//
//  EntityMapper.swift
//  YASA - Yet Another Service Architecture
//
//  Created by Tullio Sebastiani on 22/10/16.
//  Copyright © 2016 Tullio Sebastiani. All rights reserved.
//

import Foundation

protocol EntityMapping {
    associatedtype GenericMappedEntity
    func dataToEntity(data: Data) -> GenericMappedEntity?
    func entityToData(entity: GenericMappedEntity?) -> Data?
}
