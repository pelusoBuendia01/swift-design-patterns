/*
 url: https://www.tutorialspoint.com/design_pattern/flyweight_pattern.htm
 */

// MARK: Protocol
protocol Shape {
    func draw()
}

enum ShapeColor : CaseIterable {
case red, green, blue
    
}

// MARK: Protocol Implementation
struct Circle: Shape {
    
    var color: ShapeColor
    
    func draw() {
        print("I'm a Circle with color \(color)")
    }
}

// MARK: Flyweight Pattern impementation
struct ShapeFactory {
    var circleDic : [ShapeColor: Circle] = [:]
    
    mutating func getCircle(_ color: ShapeColor) -> Circle{
        guard let circle = circleDic[color] else {
            print("\t✅ Creating circle with color \(color)")
            let c = Circle(color: color)
            self.circleDic[color] = c
            return c
        }
        print("\t❌ Circle with color '\(color)'already exist")
        return circle
    }
}

// MARK: Main Demo

var factory = ShapeFactory()

for _ in 1...10 {
    var circle = factory.getCircle(
        ShapeColor.allCases.randomElement()!
    )
    
}

print("\n\n")
for color in factory.circleDic.keys {
    factory.circleDic[color]!.draw()
}
