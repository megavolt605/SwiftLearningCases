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
// 2. Также сделайте три отдельных вывода в консоль для каждого параметра
// При том одни значения доставайте по индексу, а другие по параметру
//
// 3. Создайте такой же тюпл для другого человека (супруги или друга)
// с такими же параметрами, но с другими значениями
//
// 4. Создайте третий тюпл с теми же параметрами, но значения это разница
// между соответствующими значениями первого и второго тюплов

//  Write some awesome Swift code, or import libraries like "Foundation",
//  "Dispatch", or "Glibc"

print("Hello world!")


var bodybuilding : (pushUp: Int, pullUp: Int, sitUps: Int) = (0,0,0) 
bodybuilding = (pushUp: 80, pullUp: 30, sitUps: 300) 

print(bodybuilding) 

print(bodybuilding.0) 
print(bodybuilding.pullUp) 
print(bodybuilding.2) 
 

var bodybuilding2 = (pushUp: 10, pullUp: 0, sitUps: 100) 
print(bodybuilding2) 

var bodybuilding3 = (pushUp: bodybuilding.0 - bodybuilding2.0, pullUp: bodybuilding.1 - bodybuilding2.1, sitUps: bodybuilding.2 - bodybuilding2.2)

print(bodybuilding3)
