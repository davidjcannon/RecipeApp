//
//  ViewRecipe.swift
//  Recipe_List
//
//  Created by David Cannon on 8/15/21.
//

import SwiftUI

struct ViewRecipe: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                /*
                Text(recipe.name)
                    .font(.largeTitle.bold())
                    .padding(.horizontal)
 */
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 415, height: 200)
                    .clipped()
                Text(recipe.description)
                    .multilineTextAlignment(.center)
                
                Divider()
                
                // MARK: Cook/Prep Time
                HStack {
                    //Divider()
                    Spacer()
                    Text("Prep-Time: " + recipe.prepTime)
                    Spacer()
                    Text("Cook-Time: " + recipe.cookTime)
                    Spacer()
                }
                .padding(.horizontal)
                
                HStack {
                    Spacer()
                    Text("Total-Time: " + recipe.totalTime)
                    Spacer()
                    Text("Servings: " + String(recipe.servings))
                    Spacer()
                }
                .padding(.horizontal)
                
                // MARK: Ingredients
                //Spacer(50)
                Divider()
                
                
                // MARK: Ingredients
                HStack {
                    VStack(alignment: .leading) {
                        
                        Text("Ingredients")
                            .bold()
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .padding(.vertical, 3.0)
                        
                        ForEach (recipe.ingredients, id: \.self) { i in
                            Text("- " + i)
                        }
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    
                    Text("Directions")
                        .bold()
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                    
                    ForEach (0..<recipe.directions.count, id: \.self) { num in
                        Text(String(num+1) + ". " + recipe.directions[num])
                            .padding(.bottom, 1.0)
                    }
                }
                .padding(.horizontal)
                
            }
            .padding(.bottom, 30.0)
        }
        .navigationBarTitle(recipe.name)
    }
    
    struct ViewRecipe_Previews: PreviewProvider {
        static var previews: some View {
            let model = RecipeModel()
            
            ViewRecipe(recipe: model.Recipes[1])
        }
    }
}
