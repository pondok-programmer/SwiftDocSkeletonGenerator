# Lib

Must be able to:
    - update existing documentation
    - append documentation
    - snippet from source code
    
    
    
# Snippet from source code

```swift
/**
 Repository Class
 
 ### Usage
 
 $CODE_SNIPPET(fetchApiData)
 */
class FooRepository {
    # if DOCUMENTATION
    func fetchApiData() {
        api.fetchFoo()
    }
    #endif
}
```

becomes

```swift
/**
 Repository Class
 
 ### Usage
 
 ```swift
    api.fetchFoo()
 ```
 */
class FooRepository {
    # if DOCUMENTATION
    func fetchApiData() {
        api.fetchFoo()
    }
    #endif
}
```

Hey send this feature to SwiftDoc!
