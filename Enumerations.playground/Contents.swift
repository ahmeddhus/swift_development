import Foundation


enum Animals {
    case cat
    case dog
    case rabbit
    case hedgeDog
}

let cat = Animals.cat
cat

if cat == Animals.cat {
    "This is a cat"
}else if cat == Animals.dog {
    "This is a dog"
} else {
    "This is something else"
}

func describeAnimal (_ animal: Animals){
    switch animal {
    case .cat:
        "This is a cat"
        break
    case .dog:
        "This is a cat"
        break
    case .rabbit:
        "This is a rabbit"
        break
    case .hedgeDog:
        "This is a hedgeDog"
        break
    }
}


enum Shortcut {
    case fileOrFolder(path: URL, name: String)
    case wwwUrl(path: URL)
    case song(artist: String, songName: String)
}

let wwwApple = Shortcut.wwwUrl(
    path: URL(string: "https://apple.com")!
)

switch wwwApple {
case let .fileOrFolder(
    path:  path,
    name:  name
):
    path
    name
    break
case let .wwwUrl(path:  path):
    path
    break
case let .song(
    artist:  artist,
    songName:  songName
):
    artist
    songName
    break
}

if case let .wwwUrl(path) = wwwApple {
    path
}

let withoutYou = Shortcut.song(
    artist: "Symphony XML",
    songName: "Without You"
)

if case let .song(_, songName) = withoutYou{
    songName
}

enum Vehicle {
    case car(manufacturer: String, model: String)
    case bike(manufacturer: String, yearMade: Int)
    
    var manufacturer: String {
        switch self {
        case let .car(manufacturer, _):
            return manufacturer
        case let .bike(manufacturer, _):
            return manufacturer
        }
    }
}

func getManufacturer (from vehicle: Vehicle) -> String {
    switch vehicle {
    case let .car(manufacturer, _):
        return manufacturer
    case let .bike(manufacturer, _):
        return  manufacturer
    }
}


let car = Vehicle.car(
    manufacturer: "Tesla",
    model: "X"
)
getManufacturer(from: car)
car.manufacturer


let bike = Vehicle.bike(
    manufacturer: "HD",
    yearMade: 1987
)
getManufacturer(from: bike)
bike.manufacturer


enum FamilyMember: String {
    case father = "Dad"
    case mother = "Mom"
    case brother = "Bro"
    case sister = "Sis"
}

FamilyMember.father.rawValue
FamilyMember.brother.rawValue


enum FavoriteEmoji: String, CaseIterable {
case blush = ":)"
case rocket = "=>"
case fire = "^^^"
}

FavoriteEmoji.allCases
FavoriteEmoji.allCases.map(\.rawValue)

if let blush = FavoriteEmoji(rawValue: ":)") {
    "Found the blush emoji"
    blush
} else {
    "This emoji doesn't exist"
}

if let snow = FavoriteEmoji(rawValue: "*") {
    "Snow exists! Reaaly?"
    snow
} else {
    "As expected, snow doesn't exist in our enmu"
}

enum Height {
    case short, medium, long
    mutating func makeLong() {
        self = Height.long
    }
}

var myHeight = Height.medium
myHeight.makeLong()
myHeight


indirect enum IntOperation {
    case add(Int, Int)
    case substract (Int, Int)
    case freehand(IntOperation)
    
    func calculateResult(
        of operation: IntOperation? = nil
    ) -> Int {
        switch operation ?? self {
        case let .add(lhs,rhs):
            return lhs + rhs
        case let .substract(lhs, rhs):
            return lhs - rhs
        case let .freehand(operation):
            return calculateResult(of: operation)
        }
    }
}

let freeHand = IntOperation.freehand(.add(2, 4))
freeHand.calculateResult()
