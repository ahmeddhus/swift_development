import Foundation

extension Int {
    func PlusTwo() -> Int {
        self + 2
    }
}

let two = 2
two.PlusTwo()


struct Person {
    let firstName: String
    let lastName: String
}

extension Person {
    init(fullName: String) {
        let components = fullName
            .components(separatedBy: " ")
        self.init(
            firstName: components.first ?? fullName,
            lastName: components.last ?? fullName
        )
    }
}

let person = Person(fullName: "Foo Bar")
person.firstName
person.lastName


protocol GoesBroom {
    var vroomValue: String { get }
    func goVroom() -> String
}

extension GoesBroom {
    func goVroom() -> String {
        "\(self.goVroom()) goes vroom"
    }
}

struct Car {
    let manufactuer: String
    let model: String
}

let modelX = Car(manufactuer: "Tesla", model: "X")

extension Car: GoesBroom {
    var vroomValue: String {
        "\(self.manufactuer) model \(self.model)"
    }
}

modelX.goVroom()

class MyDouble {
    let value: Double
    init(value: Double) {
        self.value = value
    }
}

extension MyDouble {
    convenience init() {
        self.init(value: 0)
    }
}

let myDouble = MyDouble()
myDouble.value

extension GoesBroom {
    func goVroomVroomEvenMore() -> String {
        "\(self.vroomValue) is vrooming even more!"
    }
}

modelX.goVroomVroomEvenMore()
