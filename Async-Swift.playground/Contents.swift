import Foundation
import PlaygroundSupport
import _Concurrency

PlaygroundPage
    .current
    .needsIndefiniteExecution = true

func calculateFullName(
    firstName: String,
    lastName: String
) async -> String {
    try? await Task.sleep(for: .seconds(1))
    return "\(firstName) \(lastName)"
}

Task {
    let result1 = await calculateFullName(
        firstName: "Foo",
        lastName: "Bar"
    )
    async let result2 = calculateFullName(
        firstName: "Foo",
        lastName: "Bar"
    )
    await result2
}


enum Clothe {
    case socks, shirts, trousers
}

func buySocks() async throws -> Clothe {
    try await Task.sleep(for: .seconds(1))
    return Clothe.socks
}

func buyShirts() async throws -> Clothe {
    try await Task.sleep(for: .seconds(1))
    return Clothe.shirts
}

func buyTrousers() async throws -> Clothe {
    try await Task.sleep(for: .seconds(1))
    return Clothe.trousers
}

struct Ensumble: CustomDebugStringConvertible {
    
    let clothes: [Clothe]
    let totalPrice: Double
    
    var debugDescription: String {
        "Clothes = \(clothes), price = \(totalPrice)"
    }
}

func buyWholeEnsemble() async throws -> Ensumble {
    async let socks = buySocks()
    async let shirts = buyShirts()
    async let trousers = buyTrousers()
    let ensubmle = Ensumble (
        clothes: await [
            try socks,
            try shirts,
            try trousers
        ],
        totalPrice: 200
    )
    return ensubmle
}

Task {
    if let ensemble = try? await buyWholeEnsemble() {
        ensemble
    } else {
        "Something went wrong"
    }
}

func getFullName(
    delay: Duration,
    calculator: () async -> String
) async -> String {
    try? await Task.sleep(for: delay)
    return await calculator()
}

func fullName () async -> String { "Foo Bar" }

Task {
    await getFullName(
        delay: .seconds(1)
    ) {
        async let name = fullName()
        return await name
    }
}
