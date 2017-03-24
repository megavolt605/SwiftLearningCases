//: Playground - noun: a place where people can play

import Foundation

// 1. Создайте пару функций с короткими именами, которые возвращают строку с символом или строкой. Например heart() возвращает сердце и т.п. Вызовите все эти функции внутри принта для вывода строки этих символов путем конкатенации

func heart() -> Character {
    return "❤️"
}

func brain() -> String {
    return "brain"
}

func stomach() -> String {
    return "stomach"
}

print(brain() + "\(heart())" + stomach())

// 2. Шахматные клетки.
// a) Реализовать функцию, которая принимает строку с именем клетки (например, "B5") и возвращает строку “белая” или “черная”. Строку потом распечатайте в консоль
// b) Реализовать функцию, которая принимает букву и целое значение (координаты клетки) и возвращает строку “белая” или “черная”. Строку потом распечатайте в консоль

func chess1(cell: String) -> String {
    let white = "белая"
    let black = "чёрная"
    let blackCells = ["A1", "A3", "A5", "A7", "B2", "B4", "B6", "B8", "C1", "C3", "C5", "C7", "D2", "D4", "D6", "D8", "E1", "E3", "E5", "E7", "F2", "F4", "F6", "F8", "G1", "G3", "G5", "G7", "H2", "H4", "H6", "H8"]
    
    let whiteCells = ["A2", "A4", "A6", "A8", "B1", "B3", "B5", "B7", "C2", "C4", "C6", "C8", "D1", "D3", "D5", "D7", "E2", "E4", "E6", "E8", "F1", "F3", "F5", "F7", "G2", "G4", "G6", "G8", "H1", "H3", "H5", "H7"]
    
    if blackCells.contains(cell) {
        return black
    }else if whiteCells.contains(cell){
        return white
    }else {
        return "введено некорректное значение"
    }
}

print(chess1(cell: "D7"))

func chess2(column: Character, row: Int) -> String {//5
    let white = "белая"
    let black = "чёрная"
    let characters: Array<Character>  = ["A", "B", "C", "D", "E", "F", "G", "E"]
    //если они одинаково четные или одинаково нечетные, тогда черный. иначе - белый
    let indexOfColumn = characters.index(of: column)
    let columnInt = indexOfColumn! + 1
    if  columnInt % 2 > 0 {
        if row % 2 > 0{
            return black
        }else{
            return white
        }
    }else{
        if row % 2 > 0{
            return white
        }else{
            return black
        }
    }
}

print(chess2(column: "E", row: 2))

// 3. Создайте функцию, которая принимает массив, а возвращает массив в обратном порядке
// Создайте еще одну, которая принимает последовательность (Range) и возвращает массив элементов последовательности в обратном порядке
// Чтобы не дублировать код, сделайте так, чтобы функция с последовательностью вызывала первую

func f3(source: [Int]) -> [Int] {
    var result: Array <Int> = [];
    let endIndex = source.endIndex
    var i = endIndex - 1
    while i >= 0 {
        result.append(source[i])
        i -= 1
    }
    return result;
}

func f31(sourceRange: CountableRange<Int>) -> [Int]{
    let arrayFromRange = Array(sourceRange)
    return f3(source: arrayFromRange)
}

let sourceArray: [Int] = [1,2,3,4,5,6]
print("sourceArray: \(sourceArray)")
var resultArray = f3(source: sourceArray)
print("3.1 resultArray: \(resultArray)")
resultArray = f31(sourceRange: 3..<6)
print("3.2 resultArray: \(resultArray)")


// 4. Разберитесь с inout самостоятельно и выполните задание номер 3 так, чтобы функция не возвращала перевернутый массив, но меняла элементы в существующем. Что будет если убрать inout?

func f4(array: inout [Int]){
    var result: Array <Int> = [];
    let endIndex = array.endIndex
    var i = endIndex - 1
    while i >= 0 {
        result.append(array[i])
        i -= 1
    }
    array = result
}

var array1 = [10, 20, 30, 40]
f4(array: &array1)
print("4 reverse: \(array1)")

/*
// 5. Создайте функцию, которая принимает строку, убирает из нее все знаки препинания, делает все гласные большими буквами, согласные маленькими, а цифры меняет на соответствующие слова (9 -> nine и тд)

func f5(source: String) -> String {
    // ...
}
*/