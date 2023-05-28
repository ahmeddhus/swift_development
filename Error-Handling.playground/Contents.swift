import Foundation


struct Person {
    let firstName: String?
    let lastName: String?
    
    enum Errors: Error {
        case firstNameIsNil
        case lastNameIsNil
        case bothNamesAreNil
    }
    
    func getFullName() throws -> String {
        switch (firstName, lastName) {
        case(.none, .none):
            throw Errors.bothNamesAreNil
        case (.some, .none):
            throw Errors.lastNameIsNil
        case (.none, .some):
            throw Errors.firstNameIsNil
        case let(.some(firstName), .some(lastName)):
            return "\(firstName) \(lastName)"
        }
    }
}

let foo = Person(
    firstName: "Foo",
    lastName: nil
)

do {
    let fullName = try foo.getFullName()
} catch {
    "Got an error = \(error)"
}

do {
    let fullName = try foo.getFullName()
    fullName
} catch Person.Errors.firstNameIsNil {
    "First name is nil"
} catch Person.Errors.lastNameIsNil {
    "Last name is nil"
} catch Person.Errors.bothNamesAreNil {
    "Both ara nil"
} catch {
    "Other"
}


struct Car {
    let manufacturer: String
    enum Errors: Error {
        case incalidManufacturer
    }
    
    init(manufacturer: String) throws {
        if manufacturer.isEmpty {
            throw Errors.incalidManufacturer
        }
        self.manufacturer = manufacturer
    }
}

do {
    let myCar = try Car(manufacturer: "")
} catch Car.Errors.incalidManufacturer {
    "Invalid manufacturer"
} catch {
    "Other"
}

if let yourCar = try? Car(manufacturer: "Tesla") {
    "Success \(yourCar)"
} else {
    "Failes"
}

struct Dog {
    let isInjured: Bool
    let isSleeping: Bool
    
    enum BarkingErrors: Error {
        case cannotBarkIsSpleeping
    }
    
    enum RunningErrors: Error {
        case cannotRunIsInjured
    }
    
    func bark() throws {
        if isSleeping {
            throw BarkingErrors.cannotBarkIsSpleeping
        }
        "Bark..."
    }
    
    func run() throws {
        if isInjured {
            throw RunningErrors.cannotRunIsInjured
        }
        "Run..."
    }
    
    func barkAndRun() throws {
        try bark()
        try run()
    }
}


let dog = Dog(
    isInjured: true,
    isSleeping: true
)


do {
    try dog.barkAndRun()
} catch Dog.BarkingErrors.cannotBarkIsSpleeping, Dog.RunningErrors.cannotRunIsInjured {
    "Bot errors"
} catch {
    "Other"
}
