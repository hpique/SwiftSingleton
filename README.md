SwiftSingleton
==============

**_tl;dr**: Use the **class constant approach** outlined below if you are using **Swift 1.2+** and the **nested struct** if you need to support earlier versions.

An exploration of the Singleton pattern in Swift. All approaches below support lazy initialization and thread safety.

Issues and pull requests welcome.

### Approach A: Class constant

```swift
class SingletonA {
    
    static let sharedInstance: SingletonA = SingletonA()
    
    init() {
        println("AAA");
    }
    
}
```

This approach supports lazy initialization because Swift lazily initializes class constants (and variables), and is thread safe by the definition of `let`.

*Note that this approach only works with Swift 1.2+. To support earlier versions as well, see the other approaches.*

### Approach B: Nested struct

```swift
class SingletonB {
    
    class var sharedInstance : SingletonB {
        struct Static {
            static let instance : SingletonB = SingletonB()
        }
        return Static.instance
    }
    
}
```

This is an alternative construct that even works for all Swift versions (1.0+).

### Approach C: dispatch_once

The traditional Objective-C approach ported to Swift.

```swift
class SingletonC {
    
    class var sharedInstance : SingletonC {
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var instance : SingletonC? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = SingletonC()
        }
        return Static.instance!
    }
}
```

I'm fairly certain there's no advantage over the nested struct approach but I'm including it anyway as I find the differences in syntax interesting.
