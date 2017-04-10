import Foundation

// 1. Создать строку произвольного текста, минимум 200 символов. Используя цикл и оператор switch посчитать количество гласных, согласных, цифр и символов.

var sourceString = "1. Создать строку произвольного текста, минимум 200 символов. Используя цикл и оператор switch посчитать количество гласных, согласных, цифр и символов. 2. Создайте switch который принимает возраст человека и выводит описание жизненного этапа 3. Напишите функцию, принимающую на вход имя, фамилию и отчество (русские буквы). Если имя начинается с А или О, то верните имя, если же нет, то если отчество начинается на В или Д, то верните имя и отчество, если же опять нет, то в случае если фамилия начинается с Е или З, то верните только фамилию. В противном случае верните полное имя 4. Представьте, что вы играете в морской бои, и у вас осталось некоторое количество кораблей на поле 10Х10 (можно буквы и цифры, а можно только цифры). Вы должны создать свитч, который примет тюпл с координатой и выдаст один из вариантов: мимо, ранил, убил (enum)"

let vowelsArray         = "аеёиоуыэюяeyuioa".characters
let consonantsArray     = "бвгджзйклмнпрстфхцчшщъьqwrtpsdfghjklzxcvbnm".characters
let digitsArray         = "1234567890".characters
let punctuationsArray   = ".,!?;:() ".characters

var vowelsCount         = 0
var consonantsCount     = 0
var digitsCount         = 0
var punctuationsCount   = 0

sourceString = sourceString.lowercased()
for character in sourceString.characters {
    switch character {
    case let c where vowelsArray.contains(c) :
        vowelsCount += 1
    case let c where consonantsArray.contains(c):
        consonantsCount += 1
    case let c where digitsArray.contains(c):
        digitsCount += 1
    case let c where punctuationsArray.contains(c):
        punctuationsCount += 1
    default:
        print("The symbol \(character) is not recognized")
    }
}
print("Гласных: \(vowelsCount)\nСогласных: \(consonantsCount)\nЦифр: \(digitsCount)\nСимволов: \(punctuationsCount)")

// 2. Создайте switch который принимает возраст человека и выводит описание жизненного этапа

func lifeStage(age: Int){
    switch age {
    case 0...1:
        print("Infancy.(0 - 1) The confidence in the world.")
    case 2...3:
        print("Early childhood. (2 — 3 year of life) Autonomy, self-control.")
    case 4...6:
        print("Preschool age (4 — 6 years) Activity without fear of error.")
    case 7...12:
        print("School age. (7-12 years) Full value")
    case 13...19:
        print("Youth. (13-19 years) Integrity, understanding yourself.")
    case 20...29:
        print("Early maturity. (20-30 years) Love and loyalty.")
    case 30...69:
        print("Average maturity (30 — 70 years) Caring for others.")
    case 70...150:
        print("Maturity (70 - 150) — Integrity, wisdom.")
    default:
        print("Incorrect age. Age should be from 0 to 150 years.\n")
    }
}
print("Life cycle:")
lifeStage(age: 70)


// 3. Напишите функцию, принимающую на вход имя, фамилию и отчество (русские буквы). Если имя начинается с А или О, то верните имя, если же нет, то если отчество начинается на В или Д, то верните имя и отчество, если же опять нет, то в случае если фамилия начинается с Е или З, то верните только фамилию. В противном случае верните полное имя

func fistrLetter(sourceString: String) -> String{
    return sourceString[sourceString.startIndex..<sourceString.index(sourceString.startIndex, offsetBy: 1)]
}

func name(firstName: String, lastName: String, surname: String) -> String{
    var str = fistrLetter(sourceString: firstName)
    if str == "А" || str == "О" {
        return firstName
    } else {
        str = fistrLetter(sourceString: lastName)
        if str == "В" || str == "Д" {
            return firstName + " " + lastName
        } else {
            str = fistrLetter(sourceString: surname)
            if str == "Е" || str == "З"{
                return surname
            } else {
                return firstName + " " + lastName + " " + surname
            }
        }
    }
}

let nameg = name(firstName: "Светлана", lastName: "Владимировна", surname: "Ежова")
print(nameg)

// 4. Представьте, что вы играете в морской бои, и у вас осталось некоторое количество кораблей на поле 10Х10 (можно буквы и цифры, а можно только цифры). Вы должны создать свитч, который примет тюпл с координатой и выдаст один из вариантов: мимо, ранил, убил (enum)

enum Result: Int{
    case Mimo, Ranil, Ubil
    func toString() -> String{
        if self == .Mimo {return "Мимо"}
        if self == .Ranil {return "Ранил"}
        if self == .Ubil {return "Убил"}
        return ""
    }
}

typealias Shot = (vertical: Int, horizontal: Int)
let lastShot = Shot(vertical: 2, horizontal: 3)

switch lastShot {
case (vertical: 2, horizontal: 3):
    print(Result.Ranil.toString())
case (vertical: 3, horizontal: 3):
    print(Result.Ranil.toString())
case (vertical: 6, horizontal: 6):
    print(Result.Ubil.toString())
default:
    print(Result.Mimo.toString())
}