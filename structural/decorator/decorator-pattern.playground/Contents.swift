/*
 url: https://www.tutorialspoint.com/design_pattern/decorator_pattern.htm
 */

import Foundation

// Protocols
/**
  shape to be decorated
 */
protocol Shape {
    func draw()
}

// Shape Implementation
struct Circle: Shape {
    func draw() {
        print("shape: ⚫️")
    }
}

struct Rectangle: Shape {
    func draw() {
        print("shape: ⬛️")
    }
}

// MARK: Decorator Pattern Implementation

protocol ShapeDecorator : Shape {
    var shape: Shape {get}
}

extension ShapeDecorator {
    func draw() {
        shape.draw()
    }
}

struct RedShapeDecorator: ShapeDecorator {
    var shape: Shape
    func draw() {
        shape.draw()
        self.setRedColor(shape)
    }
    
    // this is  the decoration shape
    private func setRedColor(_ shape: Shape) {
        print("\t color RED")
    }
}

struct BlueShapeDecorator: ShapeDecorator {
    var shape: Shape
    func draw() {
        shape.draw()
        self.setRedColor(shape)
    }
    
    // this is  the decoration shape
    private func setRedColor(_ shape: Shape) {
        print("\t color BLUE")
    }
}

// MARK: Main Demo


print("Shapes withour color")
var circle = Circle()
var rectangle = Rectangle()

circle.draw()
rectangle.draw()

print("\nCircle with red color")

var redCircle = RedShapeDecorator(shape: circle)
var redRectangle = Blue
ShapeDecorator(shape: rectangle)
redCircle.draw()
redRectangle.draw()
