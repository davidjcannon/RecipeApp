//
//  ContentView.swift
//  Recipe_List
//
//  Created by David Cannon on 8/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        
        NavigationView {
            
            List(model.Recipes) { r in
                
                NavigationLink(
                    destination: ViewRecipe(recipe:r),
                    label: {
                        HStack {
                            Image(r.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .clipped()
                                .cornerRadius(10)
                            Text(r.name)
                                .bold()
                        }
                    })
            }
            .navigationBarTitle("Recipes")
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
