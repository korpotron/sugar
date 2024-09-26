import Foundation

public enum Knowable<T> {
    case known(_ value: T)
    case unknown(_ error: Error)
}

public extension Knowable {
    init(catching: () throws -> T) {
        do {
            let value = try catching()
            self = .known(value)
        } catch {
            self = .unknown(error)
        }
    }

    var value: T? {
        switch self {
        case let .known(value): value
        case .unknown: nil
        }
    }

    var error: Error? {
        switch self {
        case .known: nil
        case let .unknown(error): error
        }
    }

    func get() throws -> T {
        switch self {
        case let .known(value):
            return value
        case let .unknown(error):
            throw error
        }
    }
}

extension Knowable: Decodable where T: Decodable {
    public init(from decoder: any Decoder) throws {
        self.init {
            try T(from: decoder)
        }
    }
}

extension Knowable: Encodable where T: Encodable {
    public func encode(to encoder: any Encoder) throws {
        try get().encode(to: encoder)
    }
}
