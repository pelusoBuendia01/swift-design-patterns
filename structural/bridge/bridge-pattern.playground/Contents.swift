/*
 url: https://www.tutorialspoint.com/design_pattern/bridge_pattern.htm
 */

import Foundation

// MARK: Protocols

protocol DrawAPI {
    func drawCircle()
}

// MARK: Bridge Pattern

protocol Shape {
    // This is the other side of the bridge
    var drawAPI: DrawAPI {get}
    func draw()
}

struct Circle : Shape{
    
    var drawAPI: DrawAPI
    
    init(_ api: DrawAPI) {
        drawAPI = api
    }
    
    func draw() {
        drawAPI.drawCircle()
    }
}


// MARK: Draw API Implementation
struct RedCircle : DrawAPI{
    func drawCircle() {
        print("🔴")
    }
}

// MARK: Draw API Implementation
struct GreenCircle : DrawAPI{
    func drawCircle() {
        print("🟢")
    }
}

// MARK: Main Demo

var redCicle = Circle(RedCircle())
var greenCicle = Circle(GreenCircle())

redCicle.draw()
greenCicle.draw()
