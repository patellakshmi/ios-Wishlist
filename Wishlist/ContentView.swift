//
//  ContentView.swift
//  Wishlist
//
//  Created by RE on 03/05/25.
//

import SwiftUI
import SwiftData

@available(iOS 17, *)
struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [Wish]
    
    @State private var isAlertShowing: Bool = false
    @State private var title: String = ""
    
   
    var body: some View {
        NavigationStack{
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                        .font(.title.weight(.light))
                        .padding(.vertical, 2)
                        .swipeActions{
                            Button("Delete", role:.destructive){
                                modelContext.delete(wish)
                            }
                        }
                        
                }
                
            } //List
            .navigationTitle("Wishlist")
            
            .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button{
                            isAlertShowing.toggle()
                        } label: {
                            Image(systemName: "plus")
                                .imageScale(.large)
                        }
                    }
                }
            
            .alert("Create a new wish", isPresented: $isAlertShowing){
                
                TextField("Enter a wish", text: $title)
                
                Button{
                    modelContext.insert(Wish(title: title))
                    title = ""
                } label: {
                    Text("Save")
                }
                
                
            }
            .overlay{
                    if wishes.isEmpty {
                       ContentUnavailableView("My Wishlist", systemImage: "heart.circle", description: Text("No wishes yet. Add one to get started"))
                    }
                }
        }
    
    }
}

@available(iOS 17, *)
#Preview("List of smaple wishes") {
    let container = try! ModelContainer(for: Wish.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        container.mainContext.insert(Wish(title: "Test wish 1"))
        container.mainContext.insert(Wish(title: "Test wish 2"))
        
    
        return ContentView()
        .modelContainer(container)
        
    
}

@available(iOS 17, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .modelContainer(for: Wish.self, inMemory: true)
    }
}
