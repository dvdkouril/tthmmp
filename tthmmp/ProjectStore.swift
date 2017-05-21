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
    
    func initWithSampleData()
    {
        let masterThesisProject = Project()
        masterThesisProject.name = "Master Thesis"
        masterThesisProject.detailDescription = "Finish Masters degree from Computer Graphics at Masaryks University"
        masterThesisProject.status = .Finished
        allProjects.append(masterThesisProject)
        
        let blogProject = Project()
        blogProject.name = "DVDKOURIL blog"
        blogProject.detailDescription = "Blog that I write about my life"
        blogProject.status = .Active
        allProjects.append(blogProject)
        
        let germanProject = Project()
        germanProject.name = "Learning German"
        germanProject.detailDescription = "I want to learn German to be able to get around in Austria"
        germanProject.status = .Active
        allProjects.append(germanProject)
        
    }
    
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
