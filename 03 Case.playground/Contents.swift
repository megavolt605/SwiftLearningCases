import UIKit


//1. Создать строку произвольного текста, минимум 200 символов. Используя цикл и оператор switch посчитать количество гласных, согласных, цифр и символов.

let text = "sdfgsdfgsdf453654vs32342423fdvfsfgfdgbdfbgffbgbdfgsrfsdfgdsdfg565aaa,!:"

let vowel = "AEIOU"
let consonant = "BCDFGHJKLMNPQRSTVWXYZ"
let digits = "0123456789"
let punctuation = ",.!:,;!:,.;"

var vowelCount = 0
var consonantCount = 0
var digitsCount = 0
var punctuationCount = 0

for i in text.characters {
    let s = Character(String(i).uppercased())
    
    switch s {
    case s where vowel.characters.contains(s):
        vowelCount+=1
    case s where consonant.characters.contains(s):
        consonantCount+=1
    case s where digits.characters.contains(s) :
        digitsCount+=1
    case s where punctuation.characters.contains(s):
        punctuationCount+=1
    default: break
    }
}


print("vowelCount= \(vowelCount), consonantCount= \(consonantCount) digitsCount= \(digitsCount) punctuationCount= \(punctuationCount)")



//2. Создайте switch который принимает возраст человека и выводит описание жизненного этапа

var age = 35

switch age {
    
case 0...9: print("childhood")
case 10...19: print("teenager")
case 20...30: print("youth")
case 31...40: print("maturity")
case 40...50: print("experience")
case 51...60: print("wisdom")
case 61...70: print("head")
case 71...80: print("sense")
    
case 81...90: print("authorship")
case 91...100: print("contentment")
    
case 101...150: print("cyborg")
case 151...200: print("evolution")
case 201...300: print("planet mind")
case 301...400: print("star mind")
case 401...500: print("mind of the solar system")
case 501...1000: print("galaxy mind")
case 1001...3000: print("universe mind")
case 3001...10_000: print("mind of the new world")
case 100_001...10_000_000: print("splitting of the mind of the new world")
case 10_000_001...10_000_000_000: print("new worlds experiments")
    
    
default: print("nano + HItech = infinity cyborg")
}


// 3. Напишите функцию, принимающую на вход имя, фамилию и отчество (русские буквы). Если имя начинается с А или О, то верните имя, если же нет, то если отчество начинается на В или Д, то верните имя и отчество, если же опять нет, то в случае если фамилия начинается с Е или З, то верните только фамилию. В противном случае верните полное имя

func fio(name: String, patronymic: String, surname: String)-> String {
    let nameFirst = name.characters.first
    let patronymicFirst = patronymic.characters.first
    let surnameFirst = surname.characters.first
    if nameFirst == nil || patronymicFirst == nil || surnameFirst == nil {return "Sory, its not full name"}
    
    if "АО".characters.contains(nameFirst!) {return name}
    if "ВД".characters.contains(patronymicFirst!) {return "\(name) \(patronymic)"}
    if "ЕЗ".characters.contains(surnameFirst!){return surname}
    
    return "\(name) \(patronymic) \(surname)"
}

print( fio(name: "Федор", patronymic: "Степанович", surname: "Зубкин"))


// 4. Представьте, что вы играете в морской бои, и у вас осталось некоторое количество кораблей на поле 10Х10
//(можно буквы и цифры, а можно только цифры). Вы должны создать свитч, который примет тюпл с координатой и выдаст один из вариантов: мимо, ранил, убил (enum)

let ship : [(Int,Int)] = [(9,10)]
let ship2 : [(Int,Int)] = [(1,2),(1,3)]
let pole = [ship, ship2]

let coord = (9, 10)

switch coord {
case (coord.0, coord.1) where pole.contains{$0.contains{$0 == coord} && $0.count > 1} :
    print("Wounded")
case (coord.0, coord.1) where pole.contains{$0.contains{$0 == coord} && $0.count == 1}:
    print("Killed")
default: print("Slip")
}
