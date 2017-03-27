import Foundation

// 1. Создать строку произвольного текста, минимум 200 символов. Используя цикл и оператор switch посчитать количество гласных, согласных, цифр и символов.

let text = "sdfgsdfgsdf453654vs32342423fdvfsfgfdgbdfbgffbgbdfgsrfsdfgdsdfg565aaa,!:"

let vowel = "AEIOU"
let consonant = "BCDFGHJKLMNPQRSTVWXYZ"
let digits = "0123456789"
let punctuation = ",.!:,;!:,.;"

var vowelCount = 0
var consonantCount = 0
var digitsCount = 0
var punctuationCount = 0

for i in text.uppercased().characters { //!!
    //let s = Character(String(i).uppercased())
    
    switch i {
    case _ where vowel.characters.contains(i):
        vowelCount+=1
    case _ where consonant.characters.contains(i):
        consonantCount+=1
    case _ where digits.characters.contains(i) :
        digitsCount+=1
    case _ where punctuation.characters.contains(i):
        punctuationCount+=1
    default: break
    }
    
    /*
     vowelCount += vowel.characters.contains(i) ? 1 : 0
     consonantCount += consonant.characters.contains(i) ? 1 : 0
     digitsCount += digits.characters.contains(i) ? 1 : 0
     punctuationCount += punctuation.characters.contains(i) ? 1 : 0
     */
    
}

// 2. Создайте switch который принимает возраст человека и выводит описание жизненного этапа

// 3. Напишите функцию, принимающую на вход имя, фамилию и отчество (русские буквы). Если имя начинается с А или О, то верните имя, если же нет, то если отчество начинается на В или Д, то верните имя и отчество, если же опять нет, то в случае если фамилия начинается с Е или З, то верните только фамилию. В противном случае верните полное имя

// 4. Представьте, что вы играете в морской бои, и у вас осталось некоторое количество кораблей на поле 10Х10 (можно буквы и цифры, а можно только цифры). Вы должны создать свитч, который примет тюпл с координатой и выдаст один из вариантов: мимо, ранил, убил (enum)

let ship : [(Int,Int)] = [(9,10)]
let ship2 : [(Int,Int)] = [(1,2),(1,3)]
let pole = [ship, ship2] //, ship, ship2, ship, ship2, ship, ship2, ship, ship2, ship, ship2]

let coord = (9, 10)

func turn(coord: (Int, Int)) {
    if !(pole.contains { ship in
        switch coord {
        case (coord.0, coord.1) where ship.count > 1 && ship.contains{$0 == coord}:
            print("Wounded")
            return true
        case (coord.0, coord.1) where ship.count == 1 && ship.contains{$0 == coord}:
            print("Killed")
            return true
        default: return false
        }
    }) {
        print("Slip")
    }
}

turn(coord: (1, 2))

