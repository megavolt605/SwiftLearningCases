//: Playground - noun: a place where people can play

import Foundation

// ДНК
// Нуклеотиды: Аденин = A, Гуанин = G, Тимин = T, Цитозин = C
//

// 1. Сделайте описание элемента (нуклеотид) ДНК с 4 возможными типами нуклеотидов, создайте пару примеров
enum Nuk : Int{
    case Adenin, Guanin, Timin, Citozin
    static var count: Int { return Nuk.Citozin.hashValue + 1} //cool hack
}

let nuk1 = Nuk.Adenin
let nuk2 = Nuk.Citozin

// 2. Сделайте экстеншн для нуклеотида, который поможет вам потом с функцией print(...), выведите результат в консоль из п. 1

extension Nuk {
    var string: String { return String(describing: self) }
}


print(nuk1.string)
print(nuk2.string)

// 3. Сделайте описание ДНК, который содержит набор нуклеотидов, создайте пару примеров


struct DNA {
    var list: [Nuk] = []
    init(nuks: [Nuk]) {
        list = nuks
    }
}

let dna1 = DNA.init(nuks: [nuk1, nuk2])
let dna2 = DNA.init(nuks: [Nuk.Guanin, Nuk.Adenin, Nuk.Adenin])


//// 4. Сделайте экстеншн для ДНК, который поможет вам потом с функцией print(...), выведите результат в консоль из п. 3

extension DNA {
    func name() -> String {
        var allNuklsNames : String = ""
        for item in self.list {
            allNuklsNames.append(item.string + " ")
        }
        return allNuklsNames
    }
}
print(dna1.name())
print(dna2.name())

//// 5. Сделайте так, чтобы можно было создавать случайную цепочку ДНК определенной длины

extension DNA{
    init(lenth:Int) {
        for _ in 1...lenth {
            let randomIndex = Int(arc4random_uniform(UInt32(Nuk.count)))
            list.append(Nuk(rawValue:randomIndex)!)
        }
    }
}

let randomDNA = DNA(lenth: 16)
print(randomDNA.name())


// 6. Мутация (рождение ребенка)

// 6.1 Создайте 2 случайных ДНК, каждая из которых содержит 30 нуклеотидов (уловно - мама и папа), выведите их в консоль

let mama = DNA(lenth: 30)
let papa = DNA(lenth: 30)

print("Mama = " + mama.name())
print("Papa = " + papa.name())

// 6.2 Правила мутации - сравниваем элементы в обоих днк попарно в массивах из п.6.1



// 6.3 С вероятностью 40% результат будет иметь ген или "папы" или "мамы" (итоговая вероятность - 80%)
// 6.4 Иначе, результат приобретает случайный ген (вероятность 20%)
// 6.5 Создайте функцию, принимающую две ДНК на входе и отдающую результирующую ДНК (после мутации) на выходе.
// 6.6 Выведите результат мутации (ребенка) в консоль
// 6.7 Организуйте проект так, чтобы длина цепочки ДНК, а так же все вероятности были отдельными константами
// 6.8 Проверьте, имеет ли ребенок гены, отличные от обоих родителей, и сколько их
