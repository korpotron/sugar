import Foundation

public struct Clock {
    private let block: () -> Date

    public var now: Date {
        block()
    }
}

public extension Clock {
    static func of(_ block: @escaping () -> Date) -> Self {
        .init(block: block)
    }

    static var system: Self {
        .of {
            Date.now
        }
    }
}
