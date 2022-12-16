/*
 url: https://www.tutorialspoint.com/design_pattern/observer_pattern.htm
 */

// MARK: Pattern Protocol
protocol Observer {
    var subject: Subject { get set }
    func update()
}


class Subject {
    var observers : [Observer] = []
    private var _state : Int = 0
    var state : Int {
        set {
            _state = newValue
            notifyAllObservers()
        }
        get {
            return self._state
        }
    }
    
    func attach(_ observer: Observer) {
        observers.append(observer)
    }
    
    func notifyAllObservers() {
        for observer in observers {
            observer.update()
        }
    }
}

// MARK: Pattern Implementation

struct BinaryObserver : Observer {
    var subject: Subject
    
    init(_ subject: Subject) {
        self.subject = subject
        self.subject.attach(self)
    }
    
    func update() {
        print("Binary String: \(String(subject.state, radix: 2))")
    }
}

struct OctalObserver : Observer {
    var subject: Subject
    
    init(_ subject: Subject) {
        self.subject = subject
        self.subject.attach(self)
    }
    
    func update() {
        print("Octal String: \(String(subject.state, radix: 8))")
    }
}

struct HexaObserver : Observer {
    var subject: Subject
    
    init(_ subject: Subject) {
        self.subject = subject
        self.subject.attach(self)
    }
    
    func update() {
        print("Hexal String: \(String(subject.state, radix: 16).uppercased())")
    }
}

// MARK: Main Demo

var subject = Subject()
HexaObserver(subject)
OctalObserver(subject)
BinaryObserver(subject)

print("\n⚫️ First State change to 15")
subject.state = 15
print("\n⚫️ Second State change to 10")
subject.state = 10
