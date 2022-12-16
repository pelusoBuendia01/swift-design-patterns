/*
 url: https://www.tutorialspoint.com/design_pattern/prototype_pattern.htm
 */

import Foundation

// MARK: Enumerations

enum ShapeType {
    case circle, rectangle, square
}

// MARK: Protocols

protocol Shape {
    
    // properties
    var id: Int {get}
    var type: ShapeType {get}
    
}

// MARK: Shape Implementation

struct Circle: Shape  {
    
    // properties
    var id: Int
    var type: ShapeType
    
}

struct Rectangle: Shape  {
    
    // properties
    var id: Int
    var type: ShapeType
    
}

struct Square: Shape  {
    
    // properties
    var id: Int
    var type: ShapeType
    
}


// MARK: Pattern Implementation
struct ShapeCache {
    
    private var dictionary : [Int: Shape] = [:]
    
    mutating func loadCache()  {
        
        let circle = Circle(id: 1, type: .circle)
        let rectangle = Rectangle(id: 2, type: .rectangle)
        let square = Square(id: 3, type: .square)
        
        dictionary[circle.id] = circle
        dictionary[rectangle.id] = rectangle
        dictionary[square.id] = square
    }
    
    func getShape(id: Int) -> Shape? {
        let clone = dictionary[id]
        return clone
    }
    
}

// Main Demo

var shapeCache = ShapeCache()

shapeCache.loadCache()

print("Shape: \(String(describing: shapeCache.getShape(id: 1)?.type))")
print("Shape: \(String(describing: shapeCache.getShape(id: 2)?.type))")
print("Shape: \(String(describing: shapeCache.getShape(id: 3)?.type))")
