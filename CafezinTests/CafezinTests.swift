//
//  CafezinTests.swift
//  CafezinTests
//
//  Created by mbueno on 9/30/15.
//  Copyright © 2015 Thoughtworks. All rights reserved.
//

import XCTest
@testable import Cafezin

class CafezinTests: XCTestCase {
    
    var viewController: ViewController!
    
    override func setUp() {
        super.setUp()
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! ViewController
        UIApplication.sharedApplication().keyWindow?.rootViewController = viewController
    }
    
    func testEmptyIpFieldShouldRaiseAnAlertOnGetStatus() {
        viewController.ipAddress?.text = nil;
        viewController.getStatus(viewController);
        XCTAssertTrue(viewController.presentedViewController is UIAlertController)
        XCTAssertEqual(viewController.presentedViewController?.title, "Ops!")
    }
    
    func testFilledIpFieldShouldNotRaiseAnAlertOnGetStatus() {
        viewController.ipAddress?.text = "someIp";
        viewController.getStatus(viewController);
        XCTAssertFalse(viewController.presentedViewController is UIAlertController);
    }
    
    func testEmptyIpFieldShouldRaiseAnAlertOnMakeCoffee() {
        viewController.ipAddress?.text = nil;
        viewController.makeCoffee(viewController);
        XCTAssertTrue(viewController.presentedViewController is UIAlertController)
        XCTAssertEqual(viewController.presentedViewController?.title, "Ops!")
    }
    
    func testFilledIpFieldShouldNotRaiseAnAlertOnMakeCoffee() {
        viewController.ipAddress?.text = "someIp";
        viewController.makeCoffee(viewController);
        XCTAssertFalse(viewController.presentedViewController is UIAlertController);
    }
    
}
