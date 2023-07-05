//
//  AddView.swift
//  Torrei
//
//  Created by André Porto on 05/07/23.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Pessoal"
    @State private var amount = 0.0
    
    let types = ["Trabalho", "Pessoal"]
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Nome", text: $name)
                
                Picker("Tipo", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Quantidade", value: $amount, format: .currency(code: "BRL"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Adicionar despesa")
            .toolbar {
                Button("Save") {
                    let item = TorreiItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
