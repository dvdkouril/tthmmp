//
//  AddProjectViewController.swift
//  tthmmp
//
//  Created by David Kouřil on 20/04/2017.
//  Copyright © 2017 dvdkouril. All rights reserved.
//

import UIKit

class AddProjectViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var descriptionField: UITextView!
    @IBOutlet var pickerView: UIPickerView!
    
    var returnViewController : ProjectsViewController!
    
    @IBAction func SubmitButtonClicked(_ sender: Any) {
        var newProject = Project()
        newProject.name = nameField.text!
        newProject.detailDescription = descriptionField.text!
        let selectedIndex = pickerView.selectedRow(inComponent: 0)
        //newProject.status = .Waiting
        newProject.status = ProjectStatus(rawValue: selectedIndex)!
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4 // this is hardcoded for now
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ProjectStatus(rawValue: row)?.description
    }
}
