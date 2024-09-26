import Foundation
import Sugar
import Testing

@Suite
struct ClockTests {
    @Test
    func of() throws {
        let sut = Clock.of { .parse("2001-02-03T04:05:06Z") }

        #expect(sut.now.timeIntervalSince1970 == 981_173_106)
    }

    @Test
    func system() {
        let sut = Clock.system

        #expect(Int(sut.now.timeIntervalSince1970) == Int(Date.now.timeIntervalSince1970))
    }
}

private extension Date {
    static func parse(_ string: String) -> Self {
        try! Date(string, strategy: .iso8601)
    }
}
