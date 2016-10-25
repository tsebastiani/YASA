//
//  Clienting.swift
//  Yasa
//
//  Created by Tullio Sebastiani on 25/10/2016.
//  Copyright © 2016 Tullio Sebastiani. All rights reserved.
//

import UIKit

protocol Clienting {
    func setup(config: ServiceSettings)
    func query(callback: (_ data: Data?, _ error: Error?) -> ())
}
