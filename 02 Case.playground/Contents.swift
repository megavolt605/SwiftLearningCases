//: Playground - noun: a place where people can play

import Foundation

// 1. Создайте пару функций с короткими именами, которые возвращают строку с символом или строкой. Например heart() возвращает сердце и т.п. Вызовите все эти функции внутри принта для вывода строки этих символов путем конкатенации

func hearth() -> String {
    return "❤"
}

func hearth2() -> String {
    return "💖"
}
func dollar() -> String {
    return "$"
}

print(hearth() + hearth2() + dollar())
print([hearth(), hearth2(), dollar()].joined())
print([hearth(), hearth2(), dollar()].joined(separator: " --- "))

// 2. Шахматные клетки.
// a) Реализовать функцию, которая принимает строку с именем клетки (например, "B5") и возвращает строку “белая” или “черная”. Строку потом распечатайте в консоль
// b) Реализовать функцию, которая принимает букву и целое значение (координаты клетки) и возвращает строку “белая” или “черная”. Строку потом распечатайте в консоль

func chess1(cell: String) -> String {
    let column = cell.characters.first!
    let row = Int(String(cell.characters.last!))!
    return chess2(column: column, row: row)
}

infix operator ^^
func ^^(lhs: Bool, rhs: Bool) -> Bool {
    return lhs != rhs
}

func chess2(column: Character, row: Int) -> String {
    let white = "белая"
    let black = "чёрная"
    let characters = Array<Character>("ABCDEFGH".characters) // ["A", "B", "C", "D", "E", "F", "G", "H"]
    //если они одинаково четные или одинаково нечетные, тогда черный. иначе - белый
    let indexOfColumn = characters.index(of: column)!
    //let columnInt = indexOfColumn! + 1
    if  !((indexOfColumn % 2 == 0) ^^ (row % 2 != 0)) {
        return black
    } else {
        return white
    }
}

print(chess1(cell: "E2"))
print(chess2(column: "E", row: 2))

/*
// 3. Создайте функцию, которая принимает массив, а возвращает массив в обратном порядке
// Создайте еще одну, которая принимает последовательность (Range) и возвращает массив элементов последовательности в обратном порядке
// Чтобы не дублировать код, сделайте так, чтобы функция с последовательностью вызывала первую

func f3(source: [Int]) -> [Int] {
    // ...
}

// 4. Разберитесь с inout самостоятельно и выполните задание номер 3 так, чтобы функция не возвращала перевернутый массив, но меняла элементы в существующем. Что будет если убрать inout?

// 5. Создайте функцию, которая принимает строку, убирает из нее все знаки препинания, делает все гласные большими буквами, согласные маленькими, а цифры меняет на соответствующие слова (9 -> nine и тд)

func f5(source: String) -> String {
    // ...
}
*/