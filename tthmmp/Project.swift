//
//  Project.swift
//  tthmmp-mac
//
//  Created by David Kouřil on 01/04/2017.
//  Copyright © 2017 dvdkouril. All rights reserved.
//

import Foundation
import RealmSwift

enum ProjectStatus:Int {
    case Active = 0
    case Finished = 1
    case Waiting = 2
    case Canceled = 3
}

//class Project: NSObject {
class Project: Object {
    dynamic var name : String?
    dynamic var detailDescription : String?
    
    // enum realm "hack"
    dynamic var stat = ProjectStatus.Waiting.rawValue
    var status : ProjectStatus {
        get {
            return ProjectStatus(rawValue: stat)!
        }
        set {
            stat = newValue.rawValue
        }
    }
    
//    convenience required init()
//    {
//        name = "Default Project Name"
//        detailDescription = "This is a default empty project"
//        status = .Waiting
//        
//        var rndStatus : ProjectStatus
//        let rnd = arc4random_uniform(UInt32(2))
//        if rnd == 0 {
//            rndStatus = .Active
//        } else {
//            rndStatus = .Waiting
//        }
//        
//        self.init(withName: "Default Project Name",
//                  withDescription: "This is a default empty project",
//                  withStatus: rndStatus)
//    }
    
//    convenience init(withName name : String, withDescription description : String, withStatus status : ProjectStatus)
//    {
//        self.name = name
//        self.detailDescription = description
//        self.status = status
//        
//        //super.init()
//    }
    
}
