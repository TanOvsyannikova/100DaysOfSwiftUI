//
//  ContentView.swift
//  BetterRest
//
//  Created by Татьяна Овсянникова on 08.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeUpTime
    @State private var coffeeAmount = 1
    
    @State private var message = ""

    
    var body: some View {
        NavigationView {
            
            Form {
                Section {
                    VStack(alignment: .leading , spacing: 0) {
                        Text("When do you want to wake up?")
                            .font(.headline)
                        
                        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .datePickerStyle(WheelDatePickerStyle())
                            .onChange(of: wakeUp, perform: { value in calculateBedtime() })

                    }
                    
                    VStack(alignment: .leading , spacing: 0) {
                        Text("Desired amount of sleep")
                            .font(.headline)
                        
                        Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                            Text("\(sleepAmount, specifier: "%g") hours")
                        }
                        .onChange(of: sleepAmount, perform: { value in calculateBedtime() })

                        
                    }
                    
                    VStack(alignment: .leading , spacing: 0) {
                        Text("Daily coffee intake")
                            .font(.headline)
                        
                        Picker(selection: $coffeeAmount, label: Text("Cups")) {
                                     ForEach(0 ..< 21) { number in
                                          Text("\(number)")
                                     }
                                }.pickerStyle(WheelPickerStyle())
                        .labelsHidden()
                        .onChange(of: coffeeAmount, perform: { value in calculateBedtime() })

                    }
                }
                
                
                VStack(alignment: .leading , spacing: 0) {
                    Text("Your ideal bedtime is: \(message)")
                }
                .font(.headline)
            }
            .navigationBarTitle("BetterRest")
            
            
            
        }
    }
    
    static var defaultWakeUpTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    func calculateBedtime() {
        let model = SleepCalculator()
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle  = .short
            message = formatter.string(from: sleepTime)
        }
        catch {
            message = "Sorry, there was a problem calculating your bedtime"
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
