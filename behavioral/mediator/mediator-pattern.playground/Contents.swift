/**
 url: https://www.tutorialspoint.com/design_pattern/mediator_pattern.htm
 */

import Foundation

// MARK: Pattern Implementation
struct User {
    var name: String
    func sendMessage(_ msg: String) -> Void {
        ChatRoom.showMessage(self, msg)
    }
}


struct ChatRoom {
    static func showMessage(_ user: User,_ msg: String) {
        print("✉️ \(Date.now.formatted(date: .abbreviated, time: .standard)) [\(user.name)]: \(msg)")
    }
}

// MARK: Main Demo

var robert = User(name: "Robert")
var john = User(name: "John")

robert.sendMessage("Hi! John")
john.sendMessage("Hi Robert, nice to see you")
