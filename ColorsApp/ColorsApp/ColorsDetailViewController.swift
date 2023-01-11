//
//  ColorsDetailViewController.swift
//  ColorsApp
//
//  Created by Harm on 1/7/23.
//

import UIKit

class ColorsDetailViewController: UIViewController {
    
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = color ?? UIColor.white
        
        // Do any additional setup after loading the view.
    }
}
