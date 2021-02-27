//
//  ContentView.swift
//  WeSplit
//
//  Created by Татьяна Овсянникова on 26.02.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var total: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount.replacingOccurrences(of: ",", with: ".")) ?? 0
        let tipValue = orderAmount * tipSelection / 100
        let totalAmount = orderAmount + tipValue
        
        return totalAmount
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople) ?? 2
        let amountPerPerson = total / peopleCount
        
        return amountPerPerson
    }
    
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number of People", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                    }
                
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage: ", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total")) {
                    Text("$\(total, specifier: "%.2f")")
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
