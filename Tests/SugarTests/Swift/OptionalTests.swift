import Sugar
import Testing

@Suite
struct OptionalOrTests {
    @Test
    func or_throw() {
        let sut: Optional<Int> = nil

        #expect(throws: Error.self) {
            try sut.or(throw: SomeError())
        }
    }

    @Test
    func or_throw_nope() {
        let sut: Optional<Int> = 42

        #expect(throws: Never.self) {
            try sut.or(throw: SomeError())
        }
    }

    @Test
    func or_else() {
        let sut: Optional<Int> = nil

        #expect(sut.or(else: 10) == 10)
    }


    @Test
    func or_else_nope() {
        let sut: Optional<Int> = 42

        #expect(sut.or(else: 10) == 42)
    }
}

private struct SomeError: Error {}
