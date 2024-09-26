import Foundation

public extension Duration {
    static func minutes(_ minutes: some BinaryInteger) -> Self {
        .seconds(minutes * 60)
    }

    static func hours(_ hours: some BinaryInteger) -> Self {
        .minutes(hours * 60)
    }

    static func days(_ days: some BinaryInteger) -> Duration {
        .hours(days * 24)
    }
}
