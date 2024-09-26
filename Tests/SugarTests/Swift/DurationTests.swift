import Sugar
import Testing

@Suite
struct DurationTests {
    @Test
    func seconds() throws {
        let sut: Duration = .seconds(42)

        #expect(sut.components.seconds == 42)
        #expect(sut.components.attoseconds == 0)
    }

    @Test
    func minutes() {
        let sut: Duration = .minutes(42)

        #expect(sut.components.seconds == 2520)
        #expect(sut.components.attoseconds == 0)
    }

    @Test
    func hours() {
        let sut: Duration = .hours(42)

        #expect(sut.components.seconds == 151_200)
        #expect(sut.components.attoseconds == 0)
    }

    @Test
    func days() {
        let sut: Duration = .days(42)

        #expect(sut.components.seconds == 3_628_800)
        #expect(sut.components.attoseconds == 0)
    }
}
