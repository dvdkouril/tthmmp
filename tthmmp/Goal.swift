//
//  Goal.swift
//  tthmmp
//
//  Created by David Kouril on 21/05/2017.
//  Copyright © 2017 David Kouřil. All rights reserved.
//


import RealmSwift
import Foundation

class Goal : Object {
    dynamic var name : String?
    dynamic var isLongTerm = true
    dynamic var expectedFinished : Date?
}
