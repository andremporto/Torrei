//
//  ContentView.swift
//  Torrei
//
//  Created by André Porto on 05/07/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        VStack {
            NavigationView {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.mint, Color.green]),
                                   startPoint: .topLeading,
                                   endPoint: .bottom)
                    .ignoresSafeArea()
                    List {
                        ForEach(expenses.items) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: "BRL"))
                            }
                        }
                        .onDelete(perform: removeItems)
                    }
                    .scrollContentBackground(.hidden)
                    .navigationTitle("Torrei")
                    .toolbar {
                        Button {
                            showingAddExpense = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    .sheet(isPresented: $showingAddExpense) {
                        AddView(expenses: expenses)
                    }
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
