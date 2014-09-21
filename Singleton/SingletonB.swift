//
//  SingletonB.swift
//  Singleton
//
//  Created by Hermes Pique on 6/9/14.
//  Copyright (c) 2014 Hermes Pique. All rights reserved.
//

import Foundation

class SingletonB {
    
    class var sharedInstance : SingletonB {
        struct Static {
            static let instance : SingletonB = SingletonB()
        }
        return Static.instance
    }
    
    init() {
        println("BBB");
    }
    
}