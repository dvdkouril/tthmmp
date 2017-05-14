//
//  ProjectStore.swift
//  tthmmp
//
//  Created by David Kouřil on 04/04/2017.
//  Copyright © 2017 dvdkouril. All rights reserved.
//

import UIKit

class ProjectStore {
    var allProjects = [Project]()
    
//    var activeProjects : [Project] {
//        var ret = [Project]()
//        for proj in allProjects {
//            if proj.status == .Active {
//                ret.append(proj)
//            }
//        }
//        return ret
//    }
    
//    init() {
//        for _ in 0..<5 {
//            createProject()
//        }
//    }
    
    func addProject(project: Project)
    {
        allProjects.append(project)
    }
    
    func createProject() -> Project
    {
        let newProject = Project()
        newProject.name = "Default name"
        newProject.detailDescription = "Default description"
        newProject.status = .Waiting
        
        allProjects.append(newProject)
        
        return newProject
    }
    
    func getProjects(with status: ProjectStatus) -> [Project] {
        var retArray = [Project]()
        
        for proj in allProjects {
            if proj.status == status {
                retArray.append(proj)
            }
        }
        return retArray
    }
    
    func getGlobalIndexFor(status : ProjectStatus, index : Int) -> Int {
        let proj = getProjects(with: status)[index]
        return allProjects.index(of: proj)!
    }
}
