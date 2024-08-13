import Testing
import Sugar

@Suite
struct OptionalOrTests {

    @Test
    func or_throws() {
        let sut: Optional<Int> = nil

        #expect(throws: Error.self) {
            try sut.or(throw: SomeError())
        }
    }

    @Test
    func or_no_throw() {
        let sut: Optional<Int> = 42

        #expect(throws: Never.self) {
            try sut.or(throw: SomeError())
        }
    }
}

private struct SomeError: Error {}
