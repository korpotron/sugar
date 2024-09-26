import Sugar
import Testing

@Suite
struct ResultTests {
    @Test
    func fold_success() {
        let sut = prepare(.success(42))

        #expect(sut == "value 42")
    }

    @Test
    func fold_failure() {
        let sut = prepare(.failure(SomeError()))

        #expect(sut == "some error")
    }

    func prepare(_ result: Result<Int, Error>) -> String {
        result.fold { value in
            "value \(value)"
        } failure: { error in
            "some error"
        }
    }
}

private struct SomeError: Error {}
