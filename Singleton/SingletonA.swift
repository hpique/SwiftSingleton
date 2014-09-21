//
//  SingletonA.swift
//  Singleton
//
//  Created by Hermes Pique on 6/9/14.
//  Copyright (c) 2014 Hermes Pique. All rights reserved.
//

import Foundation

private let _SingletonASharedInstance = SingletonA()

class SingletonA {
    
    class var sharedInstance : SingletonA {
        return _SingletonASharedInstance
    }
    
    init() {
        println("AAA");
    }
    
}