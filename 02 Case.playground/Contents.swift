//: Playground - noun: a place where people can play

import UIKit

// 1. Создайте пару функций с короткими именами, которые возвращают строку с символом или строкой. Например heart() возвращает сердце и т.п. Вызовите все эти функции внутри принта для вывода строки этих символов путем конкатенации
func hearth() -> Character {
    return "❤"
}

func hearth2() -> Character {
    return "💖"
}
func dollar() -> Character {
    return "$"
}


print("\(hearth())" + "\(hearth2())" + "\(dollar())" )


// 2. Шахматные клетки.
// a) Реализовать функцию, которая принимает строку с именем клетки (например, "B5") и возвращает строку “белая” или “черная”. Строку потом распечатайте в консоль



func columnNumber(char: Character) -> Int? {
    
    let char = Character(String(char).lowercased())
    var str = "abcdefgh"
    
    var test : Character = " "
    repeat {
        test = str.characters.removeLast()
    } while str.characters.count > 0 && test != char
    
    return  test == char ? str.characters.count + 1 : nil
}


func chess1(cell: String) -> String {
    if cell.characters.count != 2 {return "lenght of text is not right"}
    
    if let line = Int("\(cell.characters.last!)") {
        if let column = columnNumber(char: cell.characters.first!){
            if line > 8 || line < 1 {return "bad line"}
            if (line + column) % 2 == 0 {return "Black"} else {return "White"}
        }
    }
    return "Error input"
}


print(chess1(cell: "a1"))

// b) Реализовать функцию, которая принимает букву и целое значение (координаты клетки) и возвращает строку “белая” или “черная”. Строку потом распечатайте в консоль

func chess2(column: Character, line: Int) -> String {
    if let column = columnNumber(char: column){
        if line > 8 || line < 1 {return "bad line"}
        if (line + column) % 2 == 0 {return "Black"} else {return "White"}
    }
    return "Error input"
}

print(chess2(column: "a", line: 1))

// 3. Создайте функцию, которая принимает массив, а возвращает массив в обратном порядке
// Создайте еще одну, которая принимает последовательность (Range) и возвращает массив элементов последовательности в обратном порядке
// Чтобы не дублировать код, сделайте так, чтобы функция с последовательностью вызывала первую


func f3(source: [Int]) -> [Int] {
    var source = source
    var invertMass : [Int] = []
    for _ in source{
        invertMass.append(source.removeLast())
    }
    return invertMass
}

print(f3(source: [30, 40, 50, 60]))


func f4(source : Range<Int>) -> [Int]{
    var mas : [Int] = []
    
    for i in source.lowerBound ..< source.upperBound { mas.append(i) }
    return f3(source: mas)
}


print(f4(source: 3..<18))


// 4. Разберитесь с inout самостоятельно и выполните задание номер 3 так, чтобы функция не возвращала перевернутый массив, но меняла элементы в существующем. Что будет если убрать inout?

//----inout---- если убрать inout - работать с аргументом функции будет нельзя, т.к. он константа

func f3Inout( source: inout [Int]){
    var invertMass : [Int] = []
    for _ in source{
        invertMass.append(source.removeLast())
    }
    source = invertMass
}

var masInout = [3,4,5,6,7,8,9]
print(f3Inout(source: &masInout))
print(masInout)



// 5. Создайте функцию, которая принимает строку, убирает из нее все знаки препинания, делает все гласные большими буквами, согласные маленькими, а цифры меняет на соответствующие слова (9 -> nine и тд)


func f5(source: String) -> String {
    var source = source
    source = source.uppercased()
    
    let punctuation = ",.!:,;!:,.;"
    let vowel = "A, E, I, O, U"
    let consonant = "B, C, D, F, G, H, J, K, L, M, N, P, Q, R, S, T, V, W, X, Y, Z "
    let digits = "0123456789"
    let digitsByString = ["zero","one","two","three","four","five","six","seven","eight","nine"]
    
    var result = ""
    for i in 0...source.characters.count - 1 {
        let index = source.index(source.startIndex, offsetBy: i)
        var sumbol = source.characters[index]
        if punctuation.characters.index(of: sumbol) == nil {
            var resultSumbol = "\(sumbol)"
            
            if consonant.characters.index(of: sumbol) != nil{
                resultSumbol = (resultSumbol.lowercased())
            }
            
            if digits.characters.index(of: sumbol) != nil{
                resultSumbol = digitsByString[Int(resultSumbol)!]
            }
            
            result.append(resultSumbol)
        }
    }
    return result
}


f5(source: "dsd 556 aaa")
