//
//  ViewController.swift
//  Cafezin
//
//  Created by mbueno on 9/30/15.
//  Copyright © 2015 Thoughtworks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ipAddress: UITextField!

    
    var alertController: UIAlertController = UIAlertController(title: "Ops!", message: "Insira o IP da cafeteira", preferredStyle: .Alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getStatus(sender: AnyObject) {
        if(ipAddress?.text == nil || ipAddress?.text == ""){
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func makeCoffee(sender: AnyObject) {
        if(ipAddress?.text == nil || ipAddress?.text == ""){
            presentViewController(alertController, animated: true, completion: nil)
        }
    }

}

