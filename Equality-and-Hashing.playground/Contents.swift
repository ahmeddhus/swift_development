import Foundation

struct Person: Equatable {
    let id: String
    let name: String
}

let foo1 = Person(
    id: "1",
    name: "Foo"
)
let foo2 = Person(
    id: "1",
    name: "Bar"
)

if foo1 == foo2 {
    "They are equal!"
} else {
    "They are not equal"
}

extension Person {
    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        lhs.id == rhs.id
    }
}

enum AnimalType: Equatable {
    case dog(bread: String)
    case cat(bread: String)
}

let dog1 = AnimalType.dog(bread: "Labrado")
let dog2 = AnimalType.dog(bread: "Labrado")

if dog1 == dog2 {
    "They are equal!"
} else {
    "They are not equal"
}

struct Animal: Equatable {
    let name: String
    let type: AnimalType
    
    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        lhs.type == rhs.type
    }
}

let cat1 = Animal(
    name: "Whiskers",
    type: .cat(
        bread: "Street cat"
    )
)
let cat2 = Animal(
    name: "Whoosh",
    type: .cat(
        bread: "Street cat"
    )
)

if cat1 == cat2 {
    "They are equal because of their type"
} else {
    "They are not equal"
}


struct House: Hashable {
    let number: Int
    let numberOfBedreooms: Int
}

let house1 = House(
    number: 123,
    numberOfBedreooms: 2
)
house1.hashValue

let house2 = House(
    number: 123,
    numberOfBedreooms: 3
)
house2.hashValue

let houses = Set([house1, house2])
houses.count


struct NumberedHouse: Hashable {
    let number: Int
    let numberOfBedrooms: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(number)
    }
    
    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        lhs.number == rhs.number
    }
}

let house3 = NumberedHouse(
    number: 123,
    numberOfBedrooms: 2
)

let house4 = NumberedHouse(
    number: 123,
    numberOfBedrooms: 3
)

let houses3And4 = Set([house3, house4])
houses3And4.count
house3.hashValue
house4.hashValue
house3.number.hashValue
house4.number.hashValue



enum CarPart {
    case roof
    case tire
    case trunk
}

let uniqueParts: Set<CarPart> = [
    .roof,
    .tire,
    .roof,
    .trunk
]

enum HouseType: Hashable {
    case bigHoues(NumberedHouse)
    case smallHouse(NumberedHouse)
}

let bigHouse1 = HouseType
    .bigHoues(
        NumberedHouse(
            number: 1,
            numberOfBedrooms: 1
        )
    )
let bigHouse2 = HouseType
    .bigHoues(
        NumberedHouse(
            number: 1,
            numberOfBedrooms: 1
        )
    )
let smallHouse1 = HouseType
    .smallHouse(
        NumberedHouse(
            number: 1,
            numberOfBedrooms: 1
        )
    )

let allHouses: Set<HouseType> = [
    bigHouse1,
    bigHouse2,
    smallHouse1
]

for value in allHouses {
    value
}
