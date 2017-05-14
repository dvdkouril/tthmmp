//
//  DetailViewController.swift
//  tthmmp
//
//  Created by David Kouřil on 16/04/2017.
//  Copyright © 2017 dvdkouril. All rights reserved.
//

import UIKit

class DetailViewController : UIViewController {
    
    @IBOutlet var nameField: UILabel!
    @IBOutlet var descriptionField: UILabel!
    
    var project: Project!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = project.name
//        descriptionField.text = project.description
        descriptionField.text = project.detailDescription
        
        self.navigationItem.title = "Project"
    }
}
