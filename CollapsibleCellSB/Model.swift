//
//  Model.swift
//  CollapsibleCellSB
//
//  Created by Josh R on 5/13/19.
//  Copyright © 2019 Josh R. All rights reserved.
//

import Foundation

enum IconColors: String {
    case lightBlue = "0096FF"
    case navyBlue = "005493"
    case lightPurple = "7A81FF"
    case orange = "FF9300"
    case darkGray = "5E5E5E"
}

enum Icon: String {
    case bills = "bills"
    case bus = "bus"
    case car = "car"
    case clothingAcc = "clothing accessories"
    case shoes = "clothing clothes shoes sneaker"
    case shirt = "clothing shirt"
    case coffee = "coffee"
    case electricity = "electricity"
    case fastFood = "fast food"
    case food = "food noodles"
    case gifts = "gift present birthday christmas"
    case home = "home"
    case internet = "internet"
    case train = "train"
}


struct ParentCategory {
    var name: String
    var iconColor: IconColors
    var iconImg: Icon
    var subcategories: [Subcategory]
    var isParentCellExpanded: Bool
}

struct Subcategory {
    var name: String
    var iconColor: IconColors
    var iconImg: Icon
}


var categories = [
    ParentCategory(name: "Bills", iconColor: IconColors.lightBlue, iconImg: Icon.bills, subcategories: [
        Subcategory(name: "Internet", iconColor: IconColors.lightBlue, iconImg: Icon.internet),
        Subcategory(name: "Electric", iconColor: IconColors.lightBlue, iconImg: Icon.electricity),
        Subcategory(name: "Mortgage", iconColor: IconColors.lightBlue, iconImg: Icon.home),
        ],
    isParentCellExpanded: false),
    
    ParentCategory(name: "Food", iconColor: IconColors.navyBlue, iconImg: Icon.fastFood, subcategories: [
        Subcategory(name: "Eating Out", iconColor: IconColors.navyBlue, iconImg: Icon.food),
        Subcategory(name: "Groceries", iconColor: IconColors.navyBlue, iconImg: Icon.food),
        Subcategory(name: "Coffee", iconColor: IconColors.navyBlue, iconImg: Icon.coffee),
        ],
    isParentCellExpanded: false),
    
    ParentCategory(name: "Clothing", iconColor: IconColors.lightPurple, iconImg: Icon.clothingAcc, subcategories: [
        Subcategory(name: "Clothes", iconColor: IconColors.lightPurple, iconImg: Icon.shirt),
        Subcategory(name: "Shoes", iconColor: IconColors.lightPurple, iconImg: Icon.shoes),
        Subcategory(name: "Accessories", iconColor: IconColors.lightPurple, iconImg: Icon.clothingAcc),
        ],
    isParentCellExpanded: false),
    
    ParentCategory(name: "Gifts", iconColor: IconColors.orange, iconImg: Icon.gifts, subcategories: [
        Subcategory(name: "Birthday", iconColor: IconColors.orange, iconImg: Icon.gifts),
        Subcategory(name: "Wedding", iconColor: IconColors.orange, iconImg: Icon.gifts),
        Subcategory(name: "Christmas", iconColor: IconColors.orange, iconImg: Icon.gifts),
        ],
    isParentCellExpanded: false),
    
    ParentCategory(name: "Transportation", iconColor: IconColors.darkGray, iconImg: Icon.car, subcategories: [
        Subcategory(name: "Bus", iconColor: IconColors.darkGray, iconImg: Icon.bus),
        Subcategory(name: "Train", iconColor: IconColors.darkGray, iconImg: Icon.train),
        Subcategory(name: "Ride Share", iconColor: IconColors.darkGray, iconImg: Icon.car),
        ],
    isParentCellExpanded: false),
    
    ParentCategory(name: "Automobile", iconColor: IconColors.navyBlue, iconImg: Icon.car, subcategories: [],
                   isParentCellExpanded: false)
]


