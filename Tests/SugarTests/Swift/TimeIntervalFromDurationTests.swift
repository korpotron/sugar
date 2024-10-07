import Foundation
import Sugar
import Testing

@Suite
struct TimeIntervalFromDurationTests {
    @Test
    func seconds() throws {
        let sut = Duration.seconds(42)

        #expect(TimeInterval(sut) == 42)
    }

    @Test
    func days() throws {
        let sut = Duration.days(15) + Duration.hours(5)
        let expected: Double = (15 * 86400) + (5 * 3600)

        #expect(TimeInterval(sut) == expected)
    }

    @Test
    func milliseconds() throws {
        let sut = Duration.milliseconds(33)

        #expect(TimeInterval(sut) == 0.033)
    }

    @Test
    func microseconds() throws {
        let sut = Duration.microseconds(5)

        #expect(TimeInterval(sut) == 0.000005)
    }
}
