//
//  ViewController.swift
//  YasaExample
//
//  Created by Tullio Sebastiani on 25/10/2016.
//  Copyright © 2016 Tullio Sebastiani. All rights reserved.
//

import UIKit
import Yasa

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let yasa = Yasa()
        yasa.login(username: "tullio", password: "sebastiani") { 
            print("Login")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

