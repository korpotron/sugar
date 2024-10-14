import Foundation

public final class TimeMachine: ObservableObject {
    @Published
    private(set) var date: Date

    public init(date: Date) {
        self.date = date
    }

    public func jump(to date: Date) {
        self.date = date
    }

    public func advanced(hours: Int = 0, minutes: Int = 0, seconds: Int = 0) {
        let total: Duration = .seconds(seconds) + .minutes(minutes) + .hours(hours)
        jump(to: date.advanced(by: TimeInterval(total)))
    }
}
