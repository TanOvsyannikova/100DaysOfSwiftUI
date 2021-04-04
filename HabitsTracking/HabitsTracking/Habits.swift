//
//  Habits.swift
//  HabitsTracking
//
//  Created by Татьяна Овсянникова on 04.04.2021.
//

import Foundation

class Habits: ObservableObject {
    private static let habitsKey = "habits"

        @Published var habits = [Habit]() {
            didSet {
                if let encoded = try? JSONEncoder().encode(habits) {
                    UserDefaults.standard.set(encoded, forKey: Self.habitsKey)
                }
            }
        }

        init() {
            if let encoded = UserDefaults.standard.data(forKey: Self.habitsKey) {
                if let decoded = try? JSONDecoder().decode([Habit].self, from: encoded) {
                    self.habits = decoded
                    return
                }
            }

            self.habits = []
        }

        func add(habit: Habit) {
            habits.append(habit)
            sorthabits()
        }

        func update(habit: Habit) {
            guard let index = getIndex(habit: habit) else { return }

            habits[index] = habit
            sorthabits()
        }

        private func sorthabits() {
            habits.sort(by: { $0.lastModifiedDate > $1.lastModifiedDate } )
        }

        func getHabit(id: UUID) -> Habit {
            guard let index = getIndex(id: id) else { return Habit(title: "", description: "") }

            return habits[index]
        }

        private func getIndex(habit: Habit) -> Int? {
            return habits.firstIndex(where: { $0.id == habit.id })
        }

        private func getIndex(id: UUID) -> Int? {
            return habits.firstIndex(where: { $0.id == id })
        }
}
