import Foundation

public extension Optional {
    func or(throw error: Error) throws -> Wrapped {
        switch self {
        case let .some(value):
            return value
        case .none:
            throw error
        }
    }

    func or(else value: Wrapped) -> Wrapped {
        switch self {
        case let .some(wrapped):
            wrapped
        case .none:
            value
        }
    }
}
