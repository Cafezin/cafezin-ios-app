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
    
    class FakeAlert: UIAlertController {
        var alertShowed = false;
        override func presentViewController(viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
            alertShowed = true
        }
    }
    
    var viewController: ViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil);
        viewController = storyboard.instantiateViewControllerWithIdentifier("ViewController") as? ViewController
        viewController.loadView()
    }
    
    func testButtonExistsAndNameIsConectar() {
        XCTAssertNotNil(viewController!.connectButton)
        XCTAssertEqual(viewController!.connectButton.titleLabel?.text, "Conectar")
    }
    
    func testEmptyTokenFieldShouldRaiseAnAlert() {
        viewController.alertController = FakeAlert();
        viewController.tokenTextField?.text = nil;
        viewController.connect(viewController);
        XCTAssertTrue((viewController.alertController as! FakeAlert).alertShowed);
    }
    
    
    func testFilledTokenFieldShouldNotRaiseAnAlert() {
        viewController.alertController = FakeAlert();
        viewController.tokenTextField?.text = "token";
        viewController.connect(viewController);
        XCTAssertFalse((viewController.alertController as! FakeAlert).alertShowed);
    }
    
}
