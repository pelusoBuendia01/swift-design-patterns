/**
 url: https://www.tutorialspoint.com/design_pattern/state_pattern.htm
 */

import Foundation

protocol State {
    func doAction(_ ctx: inout Context)
    func toString() -> String
}

struct StartState: State {
    func doAction(_ ctx: inout  Context) {
        print("Player is in start state")
        ctx.state = self
    }
    
    func toString() -> String {
        return "StartState"
    }
}

struct StopState: State {
    func doAction(_ ctx: inout Context) {
        print("Player is in stop state")
        ctx.state = self
    }
    
    func toString() -> String {
        return "StopState"
    }
}

struct Context {
    var state: State? = nil
}

// MARK: Main Demo

var ctx = Context()

var startState = StartState()
startState.doAction(&ctx)
print(ctx.state!.toString())

var stopState = StopState()
stopState.doAction(&ctx)
print(ctx.state!.toString())

