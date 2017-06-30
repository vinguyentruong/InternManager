//
//  User.swift
//  InternshipManagement
//
//  Created by Nguyen Truong Dai Vi on 6/27/17.
//  Copyright © 2017 Nguyen Truong Dai Vi. All rights reserved.
//

import Foundation
class User {
    private var mID: String!
    private var mName: String!
    private var mPassword: String!
    
    init (ID: String, name: String, pass: String) {
        self.mID = ID
        self.mName = name
        self.mPassword = pass
    }
    
    var ID: String{
        return self.mID
    }
    
    var name: String {
        get {
            return mName
        }
        set {
            mName = newValue
        }
    }
    
    var pass: String {
        get {
            return mPassword
        }
        set {
            mPassword = newValue
        }
    }
}
