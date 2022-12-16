/*
 url: https://www.tutorialspoint.com/design_pattern/abstract_factory_pattern.htm
 
 */
import Foundation

// Singleton Patern
class Singleton {
    
    // unique instance
    static let shared = Singleton()
    
    func showMessage() {
        print("Hi, I'm a Singleton")
    }
}


Singleton.shared.showMessage()


