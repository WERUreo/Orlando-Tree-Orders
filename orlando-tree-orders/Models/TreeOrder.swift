//
//  TreeOrder.swift
//  orlando-tree-orders
//
//  Created by Keli'i Martin on 6/2/16.
//  Copyright © 2016 Code for Orlando. All rights reserved.
//

import Foundation
import SwiftyJSON

class TreeOrder
{
    var order: Int?
    var treeName: String?
    var dateOrdered: NSDate?
    var savings: Double?
    var kilowattHour: Double?
    var therms: Double?
    var stormwater: Double?
    var carbon: Double?
    var air: Double?
    //var latitude: Double?
    //var longitude: Double?

    init(json: JSON)
    {
        if let order = json["order"].string
        {
            self.order = Int(order)
        }

        if let treeName = json["tree_name"].string
        {
            self.treeName = treeName
        }

        if let dateOrderedStr = json["date"].string
        {
            let formatter = NSDateFormatter()
            self.dateOrdered = formatter.dateFromString(dateOrderedStr)
        }

        if let savings = json["savings"].string
        {
            self.savings = Double(savings)
        }

        if let kilowattHour = json["kwh"].string
        {
            self.kilowattHour = Double(kilowattHour)
        }

        if let therms = json["therms"].string
        {
            self.therms = Double(therms)
        }

        if let stormwater = json["stormwater"].string
        {
            self.stormwater = Double(stormwater)
        }

        if let carbon = json["carbon"].string
        {
            self.carbon = Double(carbon)
        }

        if let air = json["air"].string
        {
            self.air = Double(air)
        }
    }
}