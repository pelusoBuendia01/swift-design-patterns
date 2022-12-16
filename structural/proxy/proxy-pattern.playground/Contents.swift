/*
 url: https://www.tutorialspoint.com/design_pattern/proxy_pattern.htm
 */

// MARK: Protocol
protocol Image {
    func display()
}

// MARK: Protocol Implementation
class RealImage: Image {
    var fileName : String
    
    init(_ file: String) {
        fileName = file
        loadFromDisk()
    }
    func display() {
        print("\tdisplating image \(fileName)")
    }
    
    func loadFromDisk() {
        print("loading \(fileName) from disk")
    }
}

class ProxyImage : Image {
    
    private var fileName: String
    var realImage: RealImage?
    
    init(_ file: String) {
        fileName = file
    }
    
    func display() {
        if realImage == nil {
            realImage = RealImage(self.fileName)
        }
        realImage?.display()
    }
}

// MARK: Proxy Pattern Implementation

let image = ProxyImage("globito")
image.display()
image.display()
