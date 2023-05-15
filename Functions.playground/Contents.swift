import Foundation

func noArgumentAndNoReturnValue(){
    "I don't what I'm doing"
}
noArgumentAndNoReturnValue()


func plusTwo(value: Int){
    let newValue = value + 2
}
plusTwo(value: 30)


func newPlusTwo (value: Int) -> Int{
    return value + 2
}
newPlusTwo(value: 30)

func customAdd(
    value1: Int,
    value2: Int
) -> Int {
    return value1 + value2
}

let customAdded = customAdd(
    value1: 10,
    value2: 20
)

/// arguments without external name add `_ ` before argument name
func customMinus(
    _ lhs: Int,
    _ rhs: Int
) -> Int{
    lhs - rhs
}
let customSubtracted = customMinus(
    20,
    10
)

/// `@discardableResult` annotation to not returning function value in playground automatically.
@discardableResult
func myCustomAdd(
    _ lhs: Int,
    _ rhs :Int
) -> Int {
    lhs + rhs
}

myCustomAdd(
    20,
    30
)


func doSomethingComlicated(
    /// `with` is external argument and `value` is internal one.
    with value: Int
) -> Int{
    func mainLogic(value: Int) -> Int{
        value + 2
    }
    
    return mainLogic(value: value + 3)
}
doSomethingComlicated(with: 30)

func getFullName(
    firstName: String = "Foo",
    lastName: String = "Bar"
) -> String {
    "\(firstName) \(lastName)"
}
getFullName()
getFullName(firstName: "Ahmed")
getFullName(lastName: "Hussein")
getFullName(firstName: "Ahmed", lastName: "Hussein")
