/*
 url: https://www.tutorialspoint.com/design_pattern/visitor_pattern.htm
 */


protocol ComputerPartVisitor {
    func visit(_ part: Computer)
    func visit(_ part: Keyboard)
    func visit(_ part: Mouse)
    func visit(_ part: Monitor)
}

protocol ComputerPart {
    func accept(_ visitor: ComputerPartVisitor)
}


struct Keyboard: ComputerPart {
    func accept(_ visitor: ComputerPartVisitor) {
        visitor.visit(self)
    }
}

struct Mouse: ComputerPart {
    func accept(_ visitor: ComputerPartVisitor) {
        visitor.visit(self)
    }
}

struct Monitor: ComputerPart {
    func accept(_ visitor: ComputerPartVisitor) {
        visitor.visit(self)
    }
}

struct Computer: ComputerPart {
    
    var parts: [ComputerPart] = [
        Keyboard(),
        Mouse(),
        Monitor()
    ]
    
    func accept(_ visitor: ComputerPartVisitor) {
        for part in parts {
            part.accept(visitor)
        }
        visitor.visit(self)
    }
}

struct ComputerPartDisplayVisitor: ComputerPartVisitor {
    func visit(_ part: Computer) {
        print("Displaying Computer")
    }
    
    func visit(_ part: Keyboard) {
        print("Displaying Keyboard")
    }
    
    func visit(_ part: Mouse) {
        print("Displaying Mouse")
    }
    
    func visit(_ part: Monitor) {
        print("Displaying Monitor")
    }
    
}

// MARK: Main Demo

var computer = Computer()
computer.accept( ComputerPartDisplayVisitor() )
