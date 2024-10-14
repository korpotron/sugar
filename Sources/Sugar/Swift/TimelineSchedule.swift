import SwiftUI

extension TimelineSchedule where Self == PeriodicTimelineSchedule {
    static var everySecond: PeriodicTimelineSchedule {
        .periodic(from: .now, by: .seconds(1))
    }
}
