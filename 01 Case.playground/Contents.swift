import Foundation

// 1. Создать тюпл с тремя параметрами:
//
// - максимальное количество отжиманий
// - максимальное количество подтягиваний
// - максимальное количество приседаний
//
// Заполните его своими достижениями :)
//
// Распечатайте его через print()
//
typealias ExercisesTuple = (pushups: Int, pullups: Int, squats: Int)
let myWorkout = ExercisesTuple(pushups: 100, pullups: 50, squats: 75)
print(myWorkout)

// 2. Также сделайте три отдельных вывода в консоль для каждого параметра
// При том одни значения доставайте по индексу, а другие по параметру
//
print("My workout:\n pushups: \(myWorkout.pushups)\n pullups: \(myWorkout.1)\n squats:  \(myWorkout.squats)")

// 3. Создайте такой же тюпл для другого человека (супруги или друга)
// с такими же параметрами, но с другими значениями
//
let friendsWorkout = ExercisesTuple(pushups: 7, pullups: 2, squats: 14)
print("Friend's workout:\n pushups: \(friendsWorkout.0)\n pullups: \(friendsWorkout.1)\n squats:  \(friendsWorkout.2)")

// 4. Создайте третий тюпл с теми же параметрами, но значения это разница
// между соответствующими значениями первого и второго тюплов

let eqlPushups = myWorkout.pushups - friendsWorkout.pushups
let eqlPullups = myWorkout.pullups - friendsWorkout.pullups
let eqlSquarts = myWorkout.squats  - friendsWorkout.squats
let eqlWorkout = ExercisesTuple(pushups: eqlPushups, pullups: eqlPullups, squats: eqlSquarts)
print(eqlWorkout)
