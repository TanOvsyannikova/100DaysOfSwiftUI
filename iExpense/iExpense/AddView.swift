//
//  AddView.swift
//  iExpense
//
//  Created by Татьяна Овсянникова on 19.03.2021.
//

import SwiftUI

extension String {
    static let numberFormatter = NumberFormatter()
    var doubleValue: Double? {
        String.numberFormatter.decimalSeparator = "."
        if let result =  String.numberFormatter.number(from: self) {
            return result.doubleValue
        } else {
            String.numberFormatter.decimalSeparator = ","
            if let result = String.numberFormatter.number(from: self) {
                return result.doubleValue
            }
        }
        return nil
    }
}

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    @State private var showingAlert = false
    
    static let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
            }
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing: Button("Save") {
                if let actualAmount = self.amount.doubleValue {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    showingAlert = true
                }
            })
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Oops"), message: Text("You should enter a real price"), dismissButton: .default(Text("ok")))
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
