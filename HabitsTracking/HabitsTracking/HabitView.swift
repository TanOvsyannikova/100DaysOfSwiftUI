//
//  HabitView.swift
//  HabitsTracking
//
//  Created by Татьяна Овсянникова on 04.04.2021.
//

import SwiftUI

struct HabitView: View {
    @ObservedObject var habits = Habits()
    @State var showAddHabit = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.habits) { item in
                    NavigationLink( destination: EditView(habits: self.habits, habitId: item.id)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                Text(item.description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Text(item.timesComplited == 1 ? "\(item.timesComplited) time complited" : "\(item.timesComplited) times complited")
                        }
                    }
                }
                .onDelete { offsets in
                    self.habits.habits.remove(atOffsets: offsets)
                }
            }
            .navigationBarTitle("Habits")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    Button(action: {
                        self.showAddHabit = true
                    }) {
                        Image(systemName: "plus")
                            .frame(width: 44, height: 44)
                    }
            )
        }
        .sheet(isPresented: $showAddHabit) {
            AddView(habits: self.habits)
        }
    }
}

