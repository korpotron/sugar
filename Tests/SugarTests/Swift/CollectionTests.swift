import Sugar
import Testing

@Suite
struct CollectionTests {
    @Test
    func safe_some() {
        let sut = [1, 2, 3]

        #expect(sut[safe: 2] == 3)
    }

    @Test
    func safe_none() {
        let sut = [1, 2, 3]

        #expect(sut[safe: 100] == nil)
    }
}
