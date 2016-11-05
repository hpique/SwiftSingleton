SwiftSingleton
==============

_tl;dr: Use the **class constant** approach if you are using Swift 1.2 or above and the **nested struct** approach if you need to support earlier versions._

An exploration of the Singleton pattern in Swift. All approaches below support lazy initialization and thread safety.

Issues and pull requests welcome.

### Approach A: Class constant

```swift
class SingletonA {
    
    static let sharedInstance = SingletonA()
    
    init() {
        println("AAA");
    }
    
}
```

This approach supports lazy initialization because Swift lazily initializes class constants (and variables), and is thread safe by the definition of `let`.

Class constants were introduced in Swift 1.2. If you need to support an earlier version of Swift, use the nested struct approach below or a global constant.

If you are using Swift 3.0.1 or above, the `init` method definition must be preceeded by the [`override` keyword][override]:

```swift
    override init() {
        println("AAA");
    }
```

### Approach B: Nested struct

```swift
class SingletonB {
    
    class var sharedInstance: SingletonB {
        struct Static {
            static let instance: SingletonB = SingletonB()
        }
        return Static.instance
    }
    
}
```

Here we are using the static constant of a nested struct as a class constant. This is a workaround for the lack of static class constants in Swift 1.1 and earlier, and still works as a workaround for the lack of static constants and variables in functions.

### Approach C: dispatch_once

The traditional Objective-C approach ported to Swift.

```swift
class SingletonC {
    
    class var sharedInstance: SingletonC {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: SingletonC? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = SingletonC()
        }
        return Static.instance!
    }
}
```

I'm fairly certain there's no advantage over the nested struct approach but I'm including it anyway as I find the differences in syntax interesting.

  [override]: https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Inheritance.html#//apple_ref/doc/uid/TP40014097-CH17-ID196
