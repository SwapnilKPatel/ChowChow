//
//  HomeViewModel.swift
//  ChowChow
//
//  Created by Swapnil on 17/09/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var foodList = [FoodModel]()
    
    init() { fetchfoodList() }
    
    func fetchfoodList() { foodList = FoodData.food }
}
