import Foundation
import Sugar
import Testing

@Suite
struct TimeMachineTests {
    @Test
    func initial() throws {
        let (sut, _) = Clock.travel(.at_2001_02_03__04_05_06)

        #expect(sut.now == .at_2001_02_03__04_05_06)
    }

    @Test
    func jump() {
        let (sut, machine) = Clock.travel(.at_2001_02_03__04_05_06)

        machine.jump(to: .at_2006_05_04__03_02_01)

        #expect(sut.now == .at_2006_05_04__03_02_01)
    }

    @Test
    func advanced() {
        let (sut, machine) = Clock.travel(.at_2001_02_03__04_05_06)

        machine.advanced(hours: 2, minutes: 4, seconds: 6)

        #expect(sut.now == .at_2001_02_03__06_09_12)
    }
}

private extension Date {
    static func parse(_ string: String) -> Self {
        try! Date(string, strategy: .iso8601)
    }

    static let at_2001_02_03__04_05_06 = Self.parse("2001-02-03T04:05:06Z")
    static let at_2001_02_03__06_09_12 = Self.parse("2001-02-03T06:09:12Z")
    static let at_2006_05_04__03_02_01 = Self.parse("2006-05-04T03:02:01Z")
}
