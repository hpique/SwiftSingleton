SwiftSingleton
==============

An exploration of the Singleton pattern in Swift. 

All approaches below support lazy initialization and thread safety. Or so it seems. 

Issues and pull requests welcomed.

### Approach A: Global constant

```swift
let _SingletonASharedInstance = SingletonA()

class SingletonA  {

    class var sharedInstance : SingletonA {
        return _SingletonASharedInstance
    }
    
}
```
We use a global constant because class constants are not yet supported.

It should be noted that Swift lazily initializes global constants (and variables).

By definition of `let`, this must be thread-safe. 

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

Unlike classes, structs do support static constants. By using a nested struct we can leverage its static constant as a class constant.

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
