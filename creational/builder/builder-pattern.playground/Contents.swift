/*
 url: https://www.tutorialspoint.com/design_pattern/builder_pattern.htm
 */

import Foundation

// MARK: Protocols

protocol Packing {
    var pack: String {get}
}

protocol Item {
    var name: String {get}
    var packing: Packing {get}
}

protocol Burger : Item {
}

protocol ColdDrink : Item {
}

// MARK: Packing Implementation
struct Wrapper: Packing{
    var pack: String
}

struct Bottle: Packing {
    var pack: String
}


// MARK: Burguer Implementation
struct VegBurger : Burger {
    var name: String = "🥬🍔"
    var packing: Packing = Wrapper(pack: "📜")
}

struct ChikenBurger: Burger {
    var name: String = "🐓🍔"
    var packing: Packing = Wrapper(pack: "🍾")
}

// MARK: ColdDrink Implementation
struct Pepsi: ColdDrink {
    var name: String = "Pepsi"
    var packing: Packing = Bottle(pack: "🍾")
}

struct Coke: ColdDrink {
    var name: String = "Coke"
    var packing: Packing = Bottle(pack: "coke-bottle")
}

struct Meal {
    
    private var items : [Item]
    
    init() {
        items = []
    }
    
    func showItems() {
        
        print("\n-----------------------------------------------")
        print("Meal items:")
        print("-----------------------------------------------")
        for item in items {
            print("\t◆ Name: \(item.name)")
            print("\t◆ Packing: \(item.packing.pack)")
            print("\t- - - - - - - - - - - - - - - - - - - - - -")
        }
    }
    
    mutating func addItem(_ item: Item) {
        items.append(item)
    }
    
}

// MARK: Protocol Implementation
struct MealBuilder {
    
    static func prepareVegMeal() -> Meal {
        var meal = Meal()
        
        // Step 1: add Burger
        meal.addItem(VegBurger())
        
        // Step 2: add ColdDrink
        meal.addItem(Pepsi())
        
        return meal
    }
    
    static func prepareChikenMeal() -> Meal {
        var meal = Meal()
        
        // Step 1: add Burger
        meal.addItem(ChikenBurger())
        
        // Step 2: add ColdDrink
        meal.addItem(Coke())
        
        return meal
    }
}


// MARK: Main Demo

var vegBurger = MealBuilder.prepareVegMeal()
var chikenBurger = MealBuilder.prepareChikenMeal()


vegBurger.showItems()
chikenBurger.showItems()
