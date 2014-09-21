//
//  SingletonATests.swift
//  Singleton
//
//  Created by Hermes Pique on 6/9/14.
//  Copyright (c) 2014 Hermes Pique. All rights reserved.
//

import XCTest
import Singleton

class SingletonATests: XCTestCase {

    func testSharedInstance() {
        let instance = SingletonA.sharedInstance
        XCTAssertNotNil(instance, "")
    }
    
    func testSharedInstance_Unique() {
        let instance1 = SingletonA()
        let instance2 = SingletonA.sharedInstance
        XCTAssertFalse(instance1 === instance2)
    }
    
    func testSharedInstance_Twice() {
        let instance1 = SingletonA.sharedInstance
        let instance2 = SingletonA.sharedInstance
        XCTAssertTrue(instance1 === instance2)
    }

    func testSharedInstance_ThreadSafety() {
        var instance1 : SingletonA!
        var instance2 : SingletonA!
        
        let expectation1 = expectationWithDescription("Instance 1")
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            instance1 = SingletonA.sharedInstance
            expectation1.fulfill()
        }
        let expectation2 = expectationWithDescription("Instance 2")
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            instance2 = SingletonA.sharedInstance
            expectation2.fulfill()
        }
        
        waitForExpectationsWithTimeout(1.0) { (_) in
            XCTAssertTrue(instance1 === instance2)
        }
    }
    
}