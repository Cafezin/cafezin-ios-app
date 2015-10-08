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
    
    func testButtonExistsAndNameIsConectar() {
        XCTAssertNotNil(viewController!.connectButton)
        XCTAssertEqual(viewController!.connectButton.titleLabel?.text, "Conectar")
    }
    
    func testEmptyTokenFieldShouldRaiseAnAlert() {
        viewController.tokenTextField?.text = nil;
        viewController.connect(viewController);
        XCTAssertTrue(viewController.presentedViewController is UIAlertController)
        XCTAssertEqual(viewController.presentedViewController?.title, "Erro")
    }
    
    
    func testFilledTokenFieldShouldNotRaiseAnAlert() {
        viewController.tokenTextField?.text = "someToken";
        viewController.connect(viewController);
        XCTAssertFalse(viewController.presentedViewController is UIAlertController);
    }
    
}
