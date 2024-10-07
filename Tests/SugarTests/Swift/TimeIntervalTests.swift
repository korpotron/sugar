import Foundation
import Sugar
import Testing

@Suite
struct TimeIntervalTests {
    @Test
    func milliseconds() {
        let sut = TimeInterval.milliseconds(3)

        #expect(sut == 0.003)
    }

    @Test
    func seconds() {
        let sut = TimeInterval.seconds(5)

        #expect(sut == 5)
    }

    @Test
    func minutes() {
        let sut = TimeInterval.minutes(7)

        #expect(sut == 420)
    }

    @Test
    func hours() {
        let sut = TimeInterval.hours(3)

        #expect(sut == 10800)
    }
}
