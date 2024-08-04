import Testing
import Sugar

@Test
func Optional_or_throws() {
    let sut: Optional<Int> = nil

    #expect(throws: Error.self) {
        try sut.or(throw: SomeError())
    }
}

@Test
func Optional_or_no_throw() {
    let sut: Optional<Int> = 42

    #expect(throws: Never.self) {
        try sut.or(throw: SomeError())
    }
}

private struct SomeError: Error {}
