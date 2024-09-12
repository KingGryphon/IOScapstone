//
//  Menu.swift
//  IOScapstone
//
//  Created by Archer Bergmann on 9/11/24.
//

import SwiftUI

struct Menu: View {

    
    @State private var menuItems: [MenuItem] = []
    @Environment(\.managedObjectContext) private var viewContext
        
    
    
    var body: some View {
        VStack {
            Text("Little Lemon")
                .font(.largeTitle)
                .padding()
            Text("Chicago")
                .font(.title2)
                .padding()
            Text("Your local Meditaranian Bistro!")
                .font(.body)
                .padding()
            List(menuItems) { item in
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                    Text(item.description)
                        .font(.subheadline)
                    Text(item.price)
                        .font(.body)
                    if let imageUrl = URL(string: item.image) {
                        AsyncImage(url: imageUrl)
                            .aspectRatio(contentMode: .fit)
                            
                            
                    }
                }
                .padding()
            }
            .onAppear {
                Task {
                    await getMenuData()
                }
            }
        }}
    func getMenuData() async {
        
        
        let serverURLString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        
        guard let url = URL(string: serverURLString) else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let data = data {
                let decoder = JSONDecoder()
                
                if let menuList = try? decoder.decode(MenuList.self, from: data)
                    for item in MenuList.menu {
                    let dish = Dish(context: viewContext)
                    dish.title = item.title
                    dish.image = item.image
                    dish.price = item.price
                    
                    do {
                        try viewContext.save()
                    } catch {
                        print("Failed to save dish: \(error)")
                    }
                }
            } else {
                print("Failed to decode data")
            }
        } catch {
            print("error fetching or decoding data: \(error)")
           
            
        } catch {
            print("Error fetching or decoding data: \(error)")
        }
    }
}
        
    

    #Preview {
        Menu()
    }

