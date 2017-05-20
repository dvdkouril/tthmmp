//
//  AddProjectViewController.swift
//  tthmmp
//
//  Created by David Kouřil on 20/04/2017.
//  Copyright © 2017 dvdkouril. All rights reserved.
//

import UIKit

class AddProjectViewController : UIViewController {
    
    @IBOutlet var nameField: UITextField!
    //@IBOutlet var descriptionField: UITextField!
    @IBOutlet var descriptionField: UITextView!
    
    var returnViewController : ProjectsViewController!
    
    @IBAction func SubmitButtonClicked(_ sender: Any) {
        var newProject = Project()
        newProject.name = nameField.text!
        newProject.detailDescription = descriptionField.text!
        newProject.status = .Waiting
        //var newProject = Project(withName: nameField.text!, withDescription: descriptionField.text!, withStatus: .Waiting)
        returnViewController.addNewProject(project: newProject)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func CancelAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        self.navigationItem.title = "Add New Project"
    }
}
