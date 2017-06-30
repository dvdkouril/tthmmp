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
        //masterThesisProject.reasonsAndGoals = ["to finish a formal education",
        //                                       "to be able to move to Vienna and do PhD"]
        let goal1 = Goal()
        goal1.name = "to finish a formal education"
        let goal2 = Goal()
        goal2.name = "to be able to move to Vienna and do PhD"
        
        masterThesisProject.reasonsAndGoals.append(goal1)
        masterThesisProject.reasonsAndGoals.append(goal2)
        allProjects.append(masterThesisProject)
        
        let goal3 = Goal(); goal3.name = "to practice writing in English"
        let goal4 = Goal(); goal4.name = "to build an audience through honesty and sharing"
        let goal5 = Goal(); goal5.name = "to collect and preserve memories of my life with Gabi"
        
        let blogProject = Project()
        blogProject.name = "DVDKOURIL blog"
        blogProject.detailDescription = "Blog that I write about my life"
        blogProject.status = .Active
        blogProject.reasonsAndGoals.append(goal3)
        blogProject.reasonsAndGoals.append(goal4)
        blogProject.reasonsAndGoals.append(goal5)
        allProjects.append(blogProject)
        
        let goal6 = Goal(); goal6.name = "to get around in Vienna"
        let goal7 = Goal(); goal7.name = "to be able to live and do business in German speaking countries"
        let goal8 = Goal(); goal8.name = "to know another language"
        
        let germanProject = Project()
        germanProject.name = "Learning German"
        germanProject.detailDescription = "I want to learn German to be able to get around in Austria"
        germanProject.status = .Active
        germanProject.reasonsAndGoals.append(goal6)
        germanProject.reasonsAndGoals.append(goal7)
        germanProject.reasonsAndGoals.append(goal8)
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
