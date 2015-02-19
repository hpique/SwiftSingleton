//
//  SingletonA.swift
//  Singleton
//
//  Created by Hermes Pique on 6/9/14.
//  Updated by Cihat Gündüz on 2/10/15.
//  Copyright (c) 2014 Hermes Pique. All rights reserved.
//

import Foundation

class SingletonA {
    
    static let sharedInstance: SingletonA = SingletonA()
    
    init() {
        println("AAA");
    }
    
}