/*
 url: https://www.tutorialspoint.com/design_pattern/command_pattern.htm
 */

// MARK: Stock
struct Stock {
    var name: String
    var quantity : Int
    
    func buy() -> Void {
        
    }
    
    func sell() -> Void {
            
    }
}

// MARK: Order Protocols
protocol Order {
    var stock: Stock {get}
    func execute()
}

// MARK: Order Protocol Implementations
struct BuyStock : Order {
    var stock: Stock
    
    func execute() {
        print("Buying\t:\(stock.quantity)\t\(stock.name)")
    }
}

struct SellStock: Order {
    var stock: Stock
    
    func execute() {
        print("Selling\t:\(stock.quantity)\t\(stock.name)")
    }
}

struct Broker {
    private var orderList : [Order] = []
    
    mutating func takeOrder(_ order: Order) {
        orderList.append(order)
    }
    
    mutating func placeOrder() {
        for order in orderList {
            order.execute()
        }
        
        orderList.removeAll()
    }
}


// MARK: Main Demo

var broker = Broker()

print("Buy")
broker.takeOrder(
    BuyStock(
        stock: Stock(
            name: "chile",
            quantity: 2
        )
    )
)

broker.takeOrder(
    BuyStock(
        stock: Stock(
            name: "tomate",
            quantity: 1
        )
    )
)

broker.takeOrder(
    BuyStock(
        stock: Stock(
            name: "cebolla",
            quantity: 1
        )
    )
)

broker.placeOrder()
print("\nSell")
broker.takeOrder(
    SellStock(
        stock: Stock(
            name: "salsa",
            quantity: 1
        )
    )
)

broker.placeOrder()
