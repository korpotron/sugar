import Foundation

public struct Supplier<T> {
    private let block: () -> T

    public init(_ block: @escaping () -> T) {
        self.block = block
    }

    public func callAsFunction() -> T {
        block()
    }
}
