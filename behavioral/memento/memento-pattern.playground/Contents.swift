/**
 url: https://www.tutorialspoint.com/design_pattern/mediator_pattern.htm
 */

// MARK: Pattern Implementation
struct Memento {
    var state: String
}

struct Originator {
    var state: String = ""
    
    func saveStateToMemento() -> Memento {
        return Memento(state: self.state)
    }
    
    mutating func getStateFromMemento(_ memento: Memento) {
        self.state = memento.state
    }
}


struct CareTaker {
    var mementoList : [Memento] = []
    
    mutating func addMemento(_ memento: Memento) {
        mementoList.append(memento)
    }
    
    func getMemento(_ index: Int) -> Memento{
        return mementoList[index]
    }
}

// MARK: Main Demo

var originator = Originator()
var careTaker = CareTaker()

originator.state = "State #1"
originator.state = "State #2"
careTaker.addMemento(originator.saveStateToMemento())

originator.state = "State #3"
careTaker.addMemento(originator.saveStateToMemento())

originator.state = "State #4"
print("Current State: \(originator.state)")

originator.getStateFromMemento(careTaker.getMemento(0))
print("First State: \(originator.state)")

originator.getStateFromMemento(careTaker.getMemento(1))
print("Secod State: \(originator.state)")
