//
//  RecipeModel.swift
//  Recipe_List
//
//  Created by David Cannon on 8/11/21.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var Recipes = [Recipe]()
    
    init() {
        
        self.Recipes = DataService().getData()
    }
}
