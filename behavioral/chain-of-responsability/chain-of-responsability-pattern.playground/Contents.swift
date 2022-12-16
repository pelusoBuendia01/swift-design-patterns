/*
 url: https://www.tutorialspoint.com/design_pattern/chain_of_responsibility_pattern.htm
 */

// MARK: Protocol

enum LogLevel : Int {
    case info = 1
    case debug = 2
    case error = 3
}

// MARK: Pattern Abstraction

protocol Logger {
    var level : LogLevel {get}
    var nextLogger : Logger? {get set}
    
    func write(_ msg: String)
}

extension Logger {
    func logMessage(_ level: LogLevel, msg: String) {
        if (self.level.rawValue <= level.rawValue) {
            write(msg)
        }
        if nextLogger != nil {
            nextLogger!.logMessage(level, msg: msg)
        }
    }
}

// MARK: Pattern Implementation

class ConsoleLogger: Logger {
    var level: LogLevel
    var nextLogger: Logger?
    
    init(_ level: LogLevel) {
        self.level = level
    }
    
    func write(_ msg: String) {
        print("Standard Console::Logger: \(msg)")
    }
}

class ErrorLogger: Logger {
    var level: LogLevel
    var nextLogger: Logger?
    
    init(_ level: LogLevel) {
        self.level = level
    }
    
    func write(_ msg: String) {
        print("Error Console::Logger: \(msg)")
    }
}

class FileLogger: Logger {
    var level: LogLevel
    var nextLogger: Logger?
    
    init(_ level: LogLevel) {
        self.level = level
    }
    
    func write(_ msg: String) {
        print("File::Logger: \(msg)")
    }
}


// MARK: Main Demo

func getChainOfLogger () -> Logger {
    var errorLogger = ErrorLogger(.error)
    var fileLogger = FileLogger(.debug)
    var consoleLogger = ConsoleLogger(.info)
    
    errorLogger.nextLogger = fileLogger
    fileLogger.nextLogger = consoleLogger
    
    return errorLogger
}

var loggerChain = getChainOfLogger()

loggerChain.logMessage(.info , msg: "This is an information.")
print("")
loggerChain.logMessage(.debug, msg: "This is an debug level information.")
print("")
loggerChain.logMessage(.error, msg: "This is an error information.")
