/*
 url: https://www.tutorialspoint.com/design_pattern/abstract_factory_pattern.htm
 */
import Foundation

// Enumeration
enum ShapeType {
case rectangle, square
}

enum FactoryType {
case standard, round
}

// Protocol
protocol Shape {
    func draw()
}

protocol AbstractFactory {
    func getShape(_ shapeType: ShapeType) -> Shape
}

// Structs

struct Rectangle: Shape {
    func draw() {
        print("I'm a Rectangle")
    }
}

struct Square: Shape {
    func draw() {
        print("I'm a Square")
    }
}

struct RoundRectangle: Shape {
    func draw() {
        print("I'm a Round Rectangle")
    }
}

struct RoundSquare: Shape {
    func draw() {
        print("I'm a Round Square")
    }
}

// Factory Pattern

struct ShapeFactory : AbstractFactory{
    func getShape(_ shapeType: ShapeType) -> Shape {
        switch shapeType {
        case .rectangle: return Rectangle()
        case .square: return Square()
        }
    }
}

struct RoundShapeFactory : AbstractFactory{
    func getShape(_ shapeType: ShapeType) -> Shape {
        switch shapeType {
        case .rectangle: return RoundRectangle()
        case .square: return RoundSquare()
        }
    }
}

struct FactoryProducer {
    func getFactory(_ factoryType: FactoryType) -> AbstractFactory {
        switch factoryType {
        case .standard: return ShapeFactory()
        case .round: return RoundShapeFactory()
        }
    }
}


// Main

var square = FactoryProducer().getFactory(.standard).getShape(.square)
var rectangle = FactoryProducer().getFactory(.standard).getShape(.rectangle)
var roundSquare = FactoryProducer().getFactory(.round).getShape(.square)
var roundRectangle = FactoryProducer().getFactory(.round).getShape(.rectangle)

square.draw()
rectangle.draw()
roundSquare.draw()
roundRectangle.draw()
