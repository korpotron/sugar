import Sugar
import Testing

@Suite
struct SupplierTests {
    @Test func static_way() {
        let sut = Supplier<Int> {
            42
        }

        #expect(sut() == 42)
        #expect(sut() == 42)
    }

    @Test func dynamic_way() {
        var _value = 42
        let sut = Supplier<Int> {
            _value += 1
            return _value
        }

        #expect(sut() == 43)
        #expect(sut() == 44)
    }
}
