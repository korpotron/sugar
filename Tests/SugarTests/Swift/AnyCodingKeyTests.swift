import Sugar
import Testing

@Suite
struct AnyCodingKeyTests {
    @Test
    func init_int() {
        let sut = AnyCodingKey(intValue: 42)

        #expect(sut?.intValue == 42)
        #expect(sut?.stringValue == "Index 42")
    }

    @Test
    func init_string() {
        let sut = AnyCodingKey(stringValue: "Lorem")

        #expect(sut?.intValue == nil)
        #expect(sut?.stringValue == "Lorem")
    }
}
