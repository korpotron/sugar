import Sugar
import XCTest

final class TimeIntervalTests: XCTestCase {
    func test_seconds() {
        let sut = Duration.seconds(42)
        XCTAssertEqual(TimeInterval(sut), 42)
    }

    func test_days() {
        let sut = Duration.days(15) + Duration.hours(5)
        XCTAssertEqual(TimeInterval(sut), (15 * 86400) + (5 * 3600))
    }

    func test_milliseconds() {
        let sut = Duration.milliseconds(33)
        XCTAssertEqual(TimeInterval(sut), 0.033)
    }

    func test_microseconds() {
        let sut = Duration.microseconds(5)
        XCTAssertEqual(TimeInterval(sut), 0.000005)
    }
}
