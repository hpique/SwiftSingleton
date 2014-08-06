//
//  SingletonA.swift
//  Singleton
//
//  Created by Hermes Pique on 6/9/14.
//  Copyright (c) 2014 Hermes Pique. All rights reserved.
//

import Foundation

private let _SingletonASharedInstance = SingletonA()

// Extending NSObject is not necessary. Doing it to use XCTest macros.

class SingletonA : NSObject {
    
    class var sharedInstance : SingletonA {
        return _SingletonASharedInstance
    }
    
    override init() {
        println("AAA");
    }
    
}