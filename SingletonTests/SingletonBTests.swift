//
//  SingletonBTests.swift
//  Singleton
//
//  Created by Hermes Pique on 6/9/14.
//  Copyright (c) 2014 Hermes Pique. All rights reserved.
//

import XCTest
import Singleton

class SingletonBTests: XCTestCase {
    
    func testSharedInstance() {
        let instance = SingletonB.sharedInstance
        XCTAssertNotNil(instance, "")
    }
    
    func testSharedInstance_Unique() {
        let instance1 = SingletonB()
        let instance2 = SingletonB.sharedInstance
        XCTAssertFalse(instance1 === instance2)
    }
    
    func testSharedInstance_Twice() {
        let instance1 = SingletonB.sharedInstance
        let instance2 = SingletonB.sharedInstance
        XCTAssertTrue(instance1 === instance2)
    }
    
    func testSharedInstance_ThreadSafety() {
        var instance1 : SingletonB!
        var instance2 : SingletonB!
        
        let expectation1 = expectationWithDescription("Instance 1")
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            instance1 = SingletonB.sharedInstance
            expectation1.fulfill()
        }
        let expectation2 = expectationWithDescription("Instance 2")
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            instance2 = SingletonB.sharedInstance
            expectation2.fulfill()
        }
        
        waitForExpectationsWithTimeout(1.0) { (_) in
            XCTAssertTrue(instance1 === instance2)
        }
    }
    
}