//
//  CoffeMakerRepository.swift
//  Cafezin
//
//  Created by mbueno on 10/9/15.
//  Copyright © 2015 Thoughtworks. All rights reserved.
//

import Foundation
import Alamofire

class CoffeMakerRepository: NSObject {
    class func getStatus(address: String, onSuccess: ((response: String) -> Void)!, onError:  ((error: NSError) -> Void)!) {
       Alamofire.request(.GET, address, parameters: nil)
            .responseJSON { response in
                switch response.result {
                    case .Success(let value):
                        onSuccess(response: value.valueForKey("status") as! String)
                    case .Failure(let error):
                        onError(error: error)
                }
            }
    }
    
    class func makeCoffee(address: String, onSuccess: ((response: String) -> Void)!, onError:((error: NSError) -> Void)!) {
        Alamofire.request(.POST, address, parameters: nil)
            .responseJSON { response in
                switch response.result {
                case .Success(let value):
                    onSuccess(response: value.valueForKey("status") as! String)
                case .Failure(let error):
                    onError(error: error)
                }
        }
        
    }
}
