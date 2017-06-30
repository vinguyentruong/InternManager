//
//  Mentor.swift
//  InternshipManagement
//
//  Created by Nguyen Truong Dai Vi on 6/28/17.
//  Copyright © 2017 Nguyen Truong Dai Vi. All rights reserved.
//

import Foundation
import  UIKit

class Mentor{
    private var mName: String!
    private var mID: String!
    private var mProfile: UIImage!
    
    init(ID: String, name: String) {
        self.mID = ID
        self.mName = name
    }
    
    init(ID: String, name: String, profile: UIImage? = nil) {
        self.mID = ID
        self.mName = name
        self.mProfile = profile
    }
    var name: String {
        get{
            return mName
        }
        set {
            mName = newValue
        }
    }
    
    var ID: String {
        get {
            return mID
        }
    }
    
    var profile: UIImage {
        get {
            return mProfile
        }
        set {
            mProfile = newValue
        }
    }

}
