/*
 url: https://www.tutorialspoint.com/design_pattern/interpreter_pattern.htm
 */

// MARK: Expression Protocol
protocol Expression {
    func interpret(_ context: String) -> Bool
}

// MARK: Expression Implemetation
struct TerminalExpression : Expression {
    var data: String
    
    func interpret(_ context: String) -> Bool {
        context.contains(data)
    }
}

struct AndExpression : Expression {
    var exp1 : Expression
    var exp2 : Expression
    
    func interpret(_ context: String) -> Bool {
        exp1.interpret(context) && exp2.interpret(context)
    }
}

struct OrExpression : Expression {
    var exp1 : Expression
    var exp2 : Expression
        
    func interpret(_ context: String) -> Bool {
        exp1.interpret(context) || exp2.interpret(context)
    }
}

// MARK: Main Demo

func getMaleExpression() -> Expression {
    return OrExpression(
        exp1: TerminalExpression(data: "Robert"),
        exp2: TerminalExpression(data: "John")
    )
}

func getMarriedWomanExpression() -> Expression {
    return AndExpression(
        exp1: TerminalExpression(data: "Julie"),
        exp2: TerminalExpression(data: "Married")
    )
}

var isMale = getMaleExpression()
var isMarriedWoman = getMarriedWomanExpression()

print("John is male?            : \(isMale.interpret("Robert"))")
print("Julie is a married women?: \(isMarriedWoman.interpret("Married Julie"))")
