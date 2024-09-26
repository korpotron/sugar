import Foundation

public extension Result {
    func fold<T>(success: (Success) -> T, failure: (Failure) -> T) -> T {
        switch self {
        case let .success(value):
            success(value)
        case let .failure(value):
            failure(value)
        }
    }
}
