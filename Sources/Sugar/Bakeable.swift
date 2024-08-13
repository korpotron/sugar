import Foundation

public enum Bakeable<T> {
    case baked(T)
    case unknown(Error)
}

public extension Bakeable {
    init(catching: () throws -> T) {
        do {
            let value = try catching()
            self = .baked(value)
        } catch {
            self = .unknown(error)
        }
    }

    func get() throws -> T {
        switch self {
        case let .baked(value):
            return value
        case let .unknown(error):
            throw error
        }
    }
}

extension Bakeable: Decodable where T: Decodable {
    public init(from decoder: any Decoder) throws {
        self.init {
            try T.init(from: decoder)
        }
    }
}

extension Bakeable: Encodable where T: Encodable {
    public func encode(to encoder: any Encoder) throws {
        try get().encode(to: encoder)
    }
}
