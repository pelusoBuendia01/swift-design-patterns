/**
  url : https://www.tutorialspoint.com/design_pattern/factory_pattern.htm
 */
import Foundation
enum ShapeType {
case triangle, square, circle
}
// Protocol
protocol Shape {
    func draw()
}

// Structs

struct Triangle: Shape {
    func draw() {
        print("I'm a Triangle")
    }
}

struct Square: Shape {
    func draw() {
        print("I'm a Square")
    }
}

struct Circle: Shape {
    func draw() {
        print("I'm a Circle")
    }
}


// Factory Pattern

struct ShapeFactory {
    static func getShape(_ shapeType: ShapeType) -> Shape {
        switch shapeType {
        case .triangle: return Triangle()
        case .square: return Square()
        case .circle: return Circle()
        }
    }
}


// Main

let triangle = ShapeFactory.getShape(.triangle)
let square = ShapeFactory.getShape(.square)
let circle = ShapeFactory.getShape(.circle)

triangle.draw()
square.draw()
circle.draw()
