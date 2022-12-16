/**
 url: https://www.tutorialspoint.com/design_pattern/strategy_pattern.htm
 */

protocol Strategy {
    func doOperation (_ num1: Int, _ num2: Int) -> Int
}

struct OperationAdd : Strategy {
    func doOperation(_ num1: Int, _ num2: Int) -> Int {
        return num1 + num2
    }
}

struct OperationSubstract: Strategy {
    func doOperation(_ num1: Int, _ num2: Int) -> Int {
        return num1 - num2
    }
}

struct OperationMultiply: Strategy {
    func doOperation(_ num1: Int, _ num2: Int) -> Int {
        return num1 * num2
    }
}

struct Context {
    var strategy : Strategy
    
    func executeStrategy(_ num1: Int, _ num2: Int) -> Int {
        return strategy.doOperation(num1, num2)
    }
}


// MARK: Main Demo

var num1 = 10
var num2 = 5
var ctx = Context(strategy: OperationAdd())

print("\(num1) + \(num2) = \(ctx.executeStrategy(num1, num2))")

ctx.strategy = OperationSubstract()
print("\(num1) - \(num2) = \(ctx.executeStrategy(num1, num2))")

ctx.strategy = OperationMultiply()
print("\(num1) * \(num2) = \(ctx.executeStrategy(num1, num2))")


