//
//  Project.swift
//  tthmmp-mac
//
//  Created by David Kouřil on 01/04/2017.
//  Copyright © 2017 dvdkouril. All rights reserved.
//

import Foundation
import RealmSwift

enum ProjectStatus: Int, CustomStringConvertible {
    case Active = 0
    case Finished = 1
    case Waiting = 2
    case Canceled = 3
    
    var description : String {
        switch self {
        case .Active: return "Active"
        case .Finished: return "Finished"
        case .Waiting: return "Waiting"
        case .Canceled: return "Canceled"
        }
    }
}

class Project: Object {
    dynamic var name : String?
    dynamic var detailDescription : String?
    var reasonsAndGoals = List<Goal>()
    
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
}
