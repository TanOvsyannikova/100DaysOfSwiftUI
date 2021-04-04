//
//  AddView.swift
//  HabitsTracking
//
//  Created by Татьяна Овсянникова on 04.04.2021.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode

        @ObservedObject var habits: Habits

        @State private var title = ""
        @State private var description = ""

        var body: some View {
            NavigationView {
                Form {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                }
                .navigationBarTitle("Add Habit")
                .navigationBarItems(trailing: Button("Save") {
                    let habit = Habit(title: self.title, description: self.description)
                    self.habits.add(habit: habit)
                    self.presentationMode.wrappedValue.dismiss()
                })
            }
        }
}


