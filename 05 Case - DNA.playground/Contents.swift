//: Playground - noun: a place where people can play

import Foundation

// ДНК
// Нуклеотиды: Аденин = A, Гуанин = G, Тимин = T, Цитозин = C
//
// 1. Сделайте описание элемента (нуклеотид) ДНК с 4 возможными типами нуклеотидов, создайте пару примеров
// 2. Сделайте экстеншн для нуклеотида, который поможет вам потом с функцией print(...), выведите результат в консоль из п. 1
// 3. Сделайте описание ДНК, который содержит набор нуклеотидов, создайте пару примеров
// 4. Сделайте экстеншн для ДНК, который поможет вам потом с функцией print(...), выведите результат в консоль из п. 3
// 5. Сделайте так, чтобы можно было создавать случайную цепочку ДНК определенной длины
// 6. Мутация (рождение ребенка)
// 6.1 Создайте 2 случайных ДНК, каждая из которых содержит 30 нуклеотидов (уловно - мама и папа), выведите их в консоль
// 6.2 Правила мутации - сравниваем элементы в обоих днк попарно в массивах из п.6.1
// 6.3 С вероятностью 40% результат будет иметь ген или "папы" или "мамы" (итоговая вероятность - 80%)
// 6.4 Иначе, результат приобретает случайный ген (вероятность 20%)
// 6.5 Создайте функцию, принимающую две ДНК на входе и отдающую результирующую ДНК (после мутации) на выходе.
// 6.6 Выведите результат мутации (ребенка) в консоль
// 6.7 Организуйте проект так, чтобы длина цепочки ДНК, а так же все вероятности были отдельными константами
// 6.8 Проверьте, имеет ли ребенок гены, отличные от обоих родителей, и сколько их

enum Nucleoids {
    case A, G, T, C
}

extension Nucleoids: CustomStringConvertible {
    var description: String {
        switch self {
        case .A: return "A"
        case .G: return "G"
        case .T: return "T"
        case .C: return "C"
        }
    }
    
    static func random() -> Nucleoids {
        switch arc4random_uniform(4) {
        case 0: return .A
        case 1: return .G
        case 2: return .T
        case 3: return .C
        default: fatalError("This should never happens")
        }
    }
}

let n1 = Nucleoids.A
let n2 = Nucleoids.T
print("n1", n1)
print("n2", n2)

struct DNA {
    var chain: [Nucleoids]
    
    init() {
        chain = []
    }
    
    init(chain: [Nucleoids]) {
        self.chain = chain
    }
    
    // 5
    static func random(length: Int) -> DNA {
        return DNA(chain: (0..<length).map { _ in return Nucleoids.random() } )
    }
    
    static let defaultLength = 30
    static let forceOfMom: UInt32 = 40
    static let forceOfDad: UInt32 = 40
    
}

extension DNA: CustomStringConvertible {
    var description: String {
        return chain.map { return $0.description }.joined(separator: " - ")
    }
}

let d1 = DNA(chain: [.A, .G, .C])
let d2 = DNA(chain: [.C, .C, .T])
print("d1", d1)
print("d2", d2)

let d3 = DNA.random(length: 20)
print("d3", d3)

// 6. Мутация
// 6.1 Создайте 2 случайных ДНК, каждая из которых содержит 30 нуклеотидов (уловно - мама и папа)

print("\n\nMUTATION")
print("source:")
let mom = DNA.random(length: DNA.defaultLength)
let dad = DNA.random(length: DNA.defaultLength)
print("mom", mom)
print("dad", dad)

func mutate(a: DNA, b: DNA) -> DNA {
    var res = DNA()
    for i in 0..<a.chain.count {
        switch arc4random_uniform(100) {
        case 0..<DNA.forceOfMom:
            res.chain.append(a.chain[i])
        case DNA.forceOfMom..<(DNA.forceOfMom + DNA.forceOfDad):
            res.chain.append(b.chain[i])
        default:
            res.chain.append(Nucleoids.random())
        }
    }
    return res
}

let child = mutate(a: mom, b: dad)
print("\nres", child)

var diff = 0
for i in 0..<child.chain.count {
    diff += (mom.chain[i] != child.chain[i] && dad.chain[i] != child.chain[i]) ? 1 : 0
}

print("\ndiff", diff)

var diff2: [Int] = []
for i in 0..<child.chain.count {
    if mom.chain[i] != child.chain[i] && dad.chain[i] != child.chain[i] {
        diff2.append(i)
    }
}

print("\ndiff2 count", diff2.count)
print("diff2", diff2)

/*
let z = zip([1, 2, 3], ["A", "B", "C"]) // [a] + [b] --> [(a,b)]
print("zip:", z)

let diff3 = zip(child.chain, zip(mom.chain, dad.chain)).reduce(0) {
    return $0 + (($1.0 != $1.1.0 && $1.0 != $1.1.1) ? 1 : 0)
}
print("\n diff3", diff3)
*/
 
/*
let diff4 = zip(child.chain, zip(mom.chain, dad.chain)).reduce(0) { res, element in
    return res + ((element.0 != element.1.0 && element.0 != element.1.1) ? 1 : 0)
}
print("\n diff4", diff4)
*/
/*

let diff4 = zip(child.chain, zip(mom.chain, dad.chain)).flatMap {
    return ($1.0 != $1.1.0 && $1.0 != $1.1.1) ? $0 : nil
}
print("\n diff3", diff4)*/