//
//  DataService.swift
//  Recipe_List
//
//  Created by David Cannon on 8/11/21.
//

import Foundation

class DataService {
    
    func getData() -> [Recipe] {
        
        
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else {
            print("Path doesn't exist")
            return [Recipe]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do {
        let data = try Data(contentsOf: url)
        
        let jsondecode = JSONDecoder()
            do {
                let recipeData = try jsondecode.decode([Recipe].self, from: data)
                
                for i in recipeData {
                    i.id = UUID()
                }
                
                return recipeData
                
                
            } catch {
                // Invalid JSON
                print("Invalid JSON")
                print(error)
            }
        } catch {
            print(error)
        }
        return [Recipe]()
    }
    
}
