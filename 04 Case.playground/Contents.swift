//: Playground - noun: a place where people can play

//1. Объявить протокол Food, который будет иметь проперти name (только чтение) и метод taste(), который будет выводить текст со вкусовыми ощущениями

protocol Food {
    var name: String { get }
    func taste()
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

class Cheese : Food {
    var name: String = "Cheese"
    func taste() {
        print("Cheese taste")
    }
}

let food1 = Potato()
let food2 = Tomato()
let food3 = Apple()
let food4 = Cheese()

let bag: [AnyObject] = [food1, food2, food3, food4]

func taste(food: Array<Food>){
    for item in food {
        item.taste()
    }
}

func taste1(food: Array<Any>){
    for item in food {
        if let food1  = item as? Food {
            food1.taste()
        }
    }
}
//
//3. Некоторые продукты могут испортиться, если их не положить в холодильник. Создайте новый протокол Storable, он наследуется от протокола Food и содержит еще булевую проперти - expired. У некоторых продуктов замените Food на Storable. Теперь пройдитесь по всем продуктам и, если продукт надо хранить в холодильнике, то перенесите его туда, но только если продукт не испорчен уже, иначе просто избавьтесь от него. Используйте функцию для вывода продуктов для вывода содержимого холодильника
//
//4. Добавьте проперти daysToExpire в протокол Storable. Отсортируйте массив продуктов в холодильнике. Сначала пусть идут те, кто быстрее портятся. Если срок совпадает, то сортируйте по имени.
//
//5. Не все, что мы кладем в холодильник, является едой. Поэтому сделайте так, чтобы Storable не наследовался от Food. Мы по прежнему приносим еду домой, но некоторые продукты реализуют теперь 2 протокола. Холодильник принимает только те продукты, которые еще и Storable. функция сортировки должна по прежнему работать.
