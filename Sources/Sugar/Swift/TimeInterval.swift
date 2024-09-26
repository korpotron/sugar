import Foundation

public extension TimeInterval {
    init(_ duration: Duration) {
        let value = Double(duration.components.seconds) + Double(duration.components.attoseconds) / 1_000_000_000_000_000_000
        self.init(value)
    }
}
