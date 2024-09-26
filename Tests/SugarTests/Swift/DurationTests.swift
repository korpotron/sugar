import Sugar
import XCTest

final class DurationTests: XCTestCase {
    func test_seconds() {
        let sut: Duration = .seconds(42)
        XCTAssertEqual(sut.components.seconds, 42)
        XCTAssertEqual(sut.components.attoseconds, 0)
    }

    func test_minutes() {
        let sut: Duration = .minutes(42)
        XCTAssertEqual(sut.components.seconds, 2520)
        XCTAssertEqual(sut.components.attoseconds, 0)
    }

    func test_hours() {
        let sut: Duration = .hours(42)
        XCTAssertEqual(sut.components.seconds, 151_200)
        XCTAssertEqual(sut.components.attoseconds, 0)
    }

    func test_days() {
        let sut: Duration = .days(42)
        XCTAssertEqual(sut.components.seconds, 3_628_800)
        XCTAssertEqual(sut.components.attoseconds, 0)
    }
}
