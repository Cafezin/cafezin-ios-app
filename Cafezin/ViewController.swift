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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getStatus(sender: AnyObject) {
        if(ipAddress?.text == nil || ipAddress?.text == ""){
            showAlert("Ops!", message: "Insira o IP da cafeteira")
        }
        
        CoffeMakerRepository.getStatus(ipAddress.text!, onSuccess: { response in
            self.showAlert("Status da cafeteira", message: response)
        }, onError: { error in
            self.showAlert("Erro ao ler status da cafeteira", message: "Tente novamente mais tarde")
        })
    }
    
    @IBAction func makeCoffee(sender: AnyObject) {
        
        if(ipAddress?.text == nil || ipAddress?.text == ""){
            self.showAlert("Ops!", message: "Insira o IP da cafeteira")
        }
        
        CoffeMakerRepository.makeCoffee(ipAddress.text!, onSuccess: { response in
            self.showAlert("Fazendo café", message: "Seu café estará pronto em 10 minutos")
        }, onError: { error in
            self.showAlert("Erro ao fazer café", message: "Tente novamente mais tarde")
        })
    }
    
    func showAlert(title: String, message: String) {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertController, animated:true, completion:nil)
    }

}

