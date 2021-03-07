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
    let formatter = NumberFormatter()
    formatter.locale = Locale.current
    formatter.numberStyle = .decimal
    let orderAmount = Double(truncating: formatter.number(from: checkAmount) ?? 0.0)
    let tipValue = orderAmount * tipSelection / 100
    let totalAmount = orderAmount + tipValue
    
    return totalAmount
  }
  
  var totalPerPerson: String {
    let peopleCount = Double(numberOfPeople) ?? 1
    let amountPerPerson = total / peopleCount
    let formatter = NumberFormatter()
    formatter.locale = Locale.current
    formatter.numberStyle = .currency
    
    return formatter.string(from: NSNumber(value: amountPerPerson)) ?? ""
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
            .foregroundColor(tipPercentages[tipPercentage] == 0 ? .red : .primary)
        }
        Section(header: Text("Amount per person")) {
          Text(totalPerPerson)
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
