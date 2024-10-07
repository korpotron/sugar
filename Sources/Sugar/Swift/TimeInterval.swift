import Foundation

public extension TimeInterval {
    init(_ duration: Duration) {
        let value = Double(duration.components.seconds) + Double(duration.components.attoseconds) / 1_000_000_000_000_000_000
        self.init(value)
    }
}

public extension TimeInterval {
    static func milliseconds(_ value: Int) -> TimeInterval {
        TimeInterval(value) / 1000
    }

    static func seconds(_ value: Int) -> TimeInterval {
        TimeInterval(value)
    }

    static func minutes(_ value: Int) -> TimeInterval {
        TimeInterval(value) * 60
    }

    static func hours(_ value: Int) -> TimeInterval {
        TimeInterval(value) * 3600
    }
}
