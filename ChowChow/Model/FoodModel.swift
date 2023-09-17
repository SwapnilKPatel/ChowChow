//
//  FoodModel.swift
//  ChowChow
//
//  Created by Swapnil on 17/09/23.
//

import Foundation

struct FoodModel: Identifiable {
    var id: Int
    var name: String
    var time: String
    var type: String
    var country: String
    var rate: String
    var calories: String
    var image: String
    var location: String
    var about: String
    var restaurant: RestaurantInfo
}
