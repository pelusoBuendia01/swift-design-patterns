/*
 url: https://www.tutorialspoint.com/design_pattern/template_pattern.htm
 */

protocol Game {
    func initialize()
    func startPlay()
    func endPlay()
}

extension Game {
    func play() {
        initialize()
        startPlay()
        endPlay()
    }
}

struct Cricket: Game {
    func initialize() {
        print("Cricket Game Initialized! Start playing.")
    }
    
    func startPlay() {
        print("Cricket Game Started. Enjoy the game!")
    }
    
    func endPlay() {
        print("Cricket Game Finished!")
    }
}

struct Football : Game {
    func initialize() {
        print("Football Game Initialized! Start playing.")
    }
    
    func startPlay() {
        print("Football Game Started. Enjoy the game!")
    }
    
    func endPlay() {
        print("Football Game Finished!")
    }
}

// MARK: Main Demo

var gameA = Cricket()
var gameB = Football()

print("\n 🏈")
gameB.play()

print("\n 🏏")
gameA.play()




