import Foundation


class Person {
    var name: String
    var age: Int
    
    init(
        name: String,
        age: Int
    ) {
        self.name = name
        self.age = age
    }
    
    func increaseAge() {
        self.age += 1
    }
}


let foo = Person(
    name: "FOO",
    age: 20
)
foo.age
foo.increaseAge()
foo.age

foo.age
let bar = foo
bar.increaseAge()
foo.age
bar.age


/// `===` to ensure object are point to the same memory
if foo === bar {
    "Foo and Bar point to the same memory"
} else {
    "They don't point to the same memory"
}


class Vehicle {
    func goVroom() {
        "Vroom vroom"
    }
}

class Car: Vehicle {
    
}

let car = Car()
car.goVroom()


class Person2 {
    private(set) var age: Int
    init(age: Int) {
        self.age = age
    }
    func increaseAge() {
        self.age += 1
    }
}
let baz = Person2(age: 20)
baz.age
//baz.age += 1
baz.increaseAge()
baz.age


class Tesla {
    let manufacturer = "Tesla"
    let model: String
    let year: Int
    
    init() {
        self.model = "X"
        self.year = 2023
    }
    
    init(
        model: String,
        year: Int
    ) {
        self.model = model
        self.year = year
    }
    
    convenience init(
        model: String
    ) {
        self.init(
            model: model,
            year: 2023
        )
    }
}

class TeslaModelY: Tesla {
    override init() {
        super.init(
            model: "Y",
            year: 2023
        )
    }
}

let modelY = TeslaModelY()
modelY.model
modelY.year
modelY.manufacturer

let fooBar = Person2(age: 20)
fooBar.age
func doSomething(with person: Person2) {
    person.increaseAge()
}
doSomething(with: fooBar)
fooBar.age


class MyClass {
    init() {
        "Initialized"
    }
    func doSomething() {
        "Do something"
    }
    deinit {
        "Deinitialized"
    }
}

let myClousure = {
    let myClass = MyClass()
    myClass.doSomething()
}
myClousure()


