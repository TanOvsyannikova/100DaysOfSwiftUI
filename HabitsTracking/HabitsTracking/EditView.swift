//
//  EditView.swift
//  HabitsTracking
//
//  Created by Татьяна Овсянникова on 04.04.2021.
//

import SwiftUI

struct EditView: View {
    @ObservedObject var habits: Habits
    var habitId: UUID
    
    @State var completedTimes: Int = 0
    
    var habit: Habit {
        habits.getHabit(id: habitId)
    }
    
    var body: some View {
        Form {
            Text(habit.title)
            Text(habit.description)
            Stepper(
                onIncrement: { self.updateHabit(by: 1) },
                onDecrement: { self.updateHabit(by: -1) },
                label: { Text("Completed \(habit.timesComplited) times") }
            )
        }
        .navigationBarTitle("Edit Activity")
    }
    
    func updateHabit(by change: Int) {
        var habit = self.habit
        habit.timesComplited += change
        self.habits.update(habit: habit)
    }
}


