import Foundation

public extension Array {
    @inlinable
    func first<T>(of type: T.Type) -> T? {
        first { $0 is T } as? T
    }
}
