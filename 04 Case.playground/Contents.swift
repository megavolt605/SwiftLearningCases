//: Playground - noun: a place where people can play

//1. Объявить протокол Food, который будет иметь проперти name (только чтение) и метод taste(), который будет выводить текст со вкусовыми ощущениями

protocol Food {
    var name: String { get }
    func taste()
}

protocol Storable{
    var expired : Bool { get }
    var daysToExpire: Int { get }
}

//
//2. Все продукты разных типов, которые вы принесли из супермаркета, находятся в сумке (массив) и все, как ни странно, реализуют протокол Food. Вам нужно пройтись по сумке, назвать предмет и откусить кусочек. Можете отсортировать продукты до имени. Используйте для этого отдельную функцию, которая принимает массив продуктов

class Potato : Food {
    var name: String = "Potato"
    func taste() {
        print("Potato taste")
    }
    
}

class Tomato : Food {
    var name: String = "Tomato"
    func taste() {
        print("Tomato taste")
    }
}

class Apple : Food {
    var name: String = "Apple"
    func taste() {
        print("Apple taste")
    }
}

class Cheese : Food, Storable {
    var name: String = "Cheese"
    var daysToExpire: Int = 4
    
    var expired: Bool = true
    func taste() {
        print("Cheese taste")
    }
}

class Milk : Food, Storable {
    var name: String = "Milk"
    var daysToExpire: Int = 3
    
    var expired: Bool = false
    func taste() {
        print("Milk taste")
    }
}

class Eggs : Food, Storable {
    var name: String = "Eggs"
    var daysToExpire: Int = 7
    
    var expired: Bool = false
    func taste() {
        print("Eggs taste")
    }
}

class Cream : Food, Storable {
    var name: String = "Cream"
    var daysToExpire: Int = 7
    
    var expired: Bool = false
    func taste() {
        print("Cream taste")
    }
}

class SoySauce: Food {
    var name: String = "Soy sauce"
    func taste() {
        print("Soy sauce taste")
    }
}

let food1 = Potato()
let food2 = Tomato()
let food3 = Apple()
let food4 = Cheese()
let food5 = Milk()
let food6 = Eggs()
let food7 = Cream()
let food8 = SoySauce()


let bag: [AnyObject] = [food1, food2, food3, food4, food5, food6, food7, food8]

//func taste1(food: Array<Food>){
//    for item in food {
//        item.taste()
//    }
//}

func taste(sourceArray: Array<Any>){
    for item in sourceArray {
        if let food  = item as? Food {
            food.taste()
        }
    }
}

//taste(food: bag as! Array<Food>)
print("---Let's taste it!")
taste(sourceArray: bag)

//
//3. Некоторые продукты могут испортиться, если их не положить в холодильник. Создайте новый протокол Storable, он наследуется от протокола Food и содержит еще булевую проперти - expired. У некоторых продуктов замените Food на Storable. Теперь пройдитесь по всем продуктам и, если продукт надо хранить в холодильнике, то перенесите его туда, но только если продукт не испорчен уже, иначе просто избавьтесь от него. Используйте функцию для вывода продуктов для вывода содержимого холодильника

func sortExpiredFood (bag: Array<Any>) -> Array<Storable & Food>{
    var fridge = [Storable & Food]()
    for item in bag {
        if let food = item as? Storable & Food  {
            if !food.expired { fridge.append(food) }
        }
    }
    print("---Fridge contains tastes: ")
    taste(sourceArray: fridge)
    return fridge
}

var sortedFridge = sortExpiredFood(bag: bag)

//
//4. Добавьте проперти daysToExpire в протокол Storable. Отсортируйте массив продуктов в холодильнике. Сначала пусть идут те, кто быстрее портятся. Если срок совпадает, то сортируйте по имени.

func sortWithDaysToExpire (fridge: Array<Storable & Food>) -> Array<Storable & Food>{
    let sortedFridge = fridge.sorted { (f1: Storable & Food, f2: Storable & Food) -> Bool in
        return f1.daysToExpire == f2.daysToExpire ? f1.name < f2.name : f1.daysToExpire < f2.daysToExpire
    }
    return sortedFridge
}

print("---Sorted fridge: ")
sortedFridge = sortWithDaysToExpire(fridge: sortedFridge)
taste(sourceArray: sortedFridge)

//
//5. Не все, что мы кладем в холодильник, является едой. Поэтому сделайте так, чтобы Storable не наследовался от Food.
//Мы по прежнему приносим еду домой, но некоторые продукты реализуют теперь 2 протокола. 
//Холодильник принимает только те продукты, которые еще и Storable. 
//функция сортировки должна по прежнему работать.





