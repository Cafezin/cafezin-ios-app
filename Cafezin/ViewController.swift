//
//  ViewController.swift
//  Cafezin
//
//  Created by mbueno on 9/30/15.
//  Copyright © 2015 Thoughtworks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tokenTextField: UITextField?
    @IBOutlet weak var connectButton: UIButton!
    
    var alertController: UIAlertController = UIAlertController(title: "Erro", message: "Token não pode ser vazio", preferredStyle: .Alert)
    let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) {(_) in
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func connect(sender: AnyObject) {
        if(tokenTextField?.text == nil || tokenTextField?.text == ""){
            alertController.presentViewController(self, animated: true, completion: nil)
        }
    }

}

