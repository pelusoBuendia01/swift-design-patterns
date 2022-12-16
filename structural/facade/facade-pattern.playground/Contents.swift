/*
 url: https://www.tutorialspoint.com/design_pattern/facade_pattern.htm
 */

import Foundation

// MARK: Protocols
protocol Shape {
    static func draw()
}

// MARK: Protocol Implementation
struct Circle : Shape {
    static func draw(){
        print("I'm a Circle")
    }
}

struct Rectangle : Shape {
    static func draw(){
        print("I'm a Rectangle")
    }
}

struct Square : Shape {
    static func draw(){
        print("I'm a Square")
    }
}

// Facade Pattern Implementation

struct ShapeMake {
    static func drawCircle() {
        Circle.draw()
    }
    
    static func drawRectangle() {
        Rectangle.draw()
    }
    
    static func drawSquare() {
        Square.draw()
    }
}


// MARK: Main Demo

ShapeMake.drawCircle()
ShapeMake.drawRectangle()
ShapeMake.drawSquare()
