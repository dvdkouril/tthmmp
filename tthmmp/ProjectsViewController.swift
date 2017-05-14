//
//  ProjectsViewController.swift
//  tthmmp
//
//  Created by David Kouřil on 04/04/2017.
//  Copyright © 2017 dvdkouril. All rights reserved.
//

import UIKit
import RealmSwift

class ProjectsViewController: UITableViewController {

    var projectStore: ProjectStore!
    let realm = try! Realm()

    @IBAction func addNewItem(sender: AnyObject) {
        self.navigationController?.pushViewController(AddProjectViewController(), animated: true)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    func addNewProject(project: Project) {
        projectStore.addProject(project: project)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        self.navigationItem.title = "All Projects"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let status = ProjectStatus(rawValue: section)
        return projectStore.getProjects(with: status!).count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)

        let item : Project
        item = projectStore.getProjects(with: ProjectStatus(rawValue: indexPath.section)!)[indexPath.row]
        cell.textLabel?.text = item.name
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        //return 2;
        return 4
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Active"
        case 1:
            return "Finished"
        case 2:
            return "Waiting"
        case 3:
            return "Canceled"
        default:
            return "Error"
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowProject" {
            if let path = tableView.indexPathForSelectedRow {
                let row = path.row
                let section = path.section
                let allProjectsIndex = projectStore.getGlobalIndexFor(status: ProjectStatus(rawValue: section)!, index: row)
                let proj = projectStore.allProjects[allProjectsIndex]
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.project = proj
            }
        }
        else if segue.identifier == "AddProject" {
            let addProjectViewController = segue.destination as! AddProjectViewController
            addProjectViewController.returnViewController = self
        }
    }
    
    // MARK: - Custom functions
    
    func saveState() {
        try! realm.write {
            for proj in projectStore.allProjects {
                realm.add(proj)
            }
            print("Realm - DONE WRITING")
        }
    }
    
    func restoreState() {
        realm.refresh()
        let projects = realm.objects(Project.self)
        projectStore.allProjects.removeAll()
        
        for proj in projects {
            projectStore.addProject(project: proj)
            
        }
        tableView.reloadData()
    }

}
