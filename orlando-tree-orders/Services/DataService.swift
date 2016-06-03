//
//  DataService.swift
//  orlando-tree-orders
//
//  Created by Keli'i Martin on 6/2/16.
//  Copyright © 2016 Code for Orlando. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct DataService
{
    static let sharedInstance = DataService()

    func getTreeOrders(completion: (treeOrders: [TreeOrder]) -> Void)
    {
        let urlString = "https://brigades.opendatanetwork.com/resource/7w7p-3857.json"
        var treeOrders = [TreeOrder]()

        Alamofire.request(.GET, urlString).validate().responseJSON
        { response in
            switch response.result
            {
            case .Success:
                if let value = response.result.value
                {
                    let json = JSON(value)
                    for (_, subJson) in json
                    {
                        let treeOrder = TreeOrder(json: subJson)
                        treeOrders.append(treeOrder)
                    }

                    completion(treeOrders: treeOrders)
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
}