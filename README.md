# SwiftDocSkeletonGenerator

Generate skeletal documentation for your swift code using `SwiftSyntax` based tool.

Example:

```swift
class Foo {
    
    class Bar {}
    
    struct Baz {}

}
```

become

```swift
/**
Foo Overview
Foo is not your foe

# Responsibility
Foo is your sparring partner

# Consideration
Be like Foo
*/
class Foo {

    /**
    Bar Overview
    Bar is good. Just sitting around

    # Responsibility
    Bar don't have responsibility

    # Consideration
    Don't use bar
    */
    class Bar {}
    
    
    /**
    Baz Overview
    A Codable type
    
    # Usage
    Use it to map JSON api
    */
    struct Baz {}
}
```

Feel unsatisfied? Feel free to hack it!!

