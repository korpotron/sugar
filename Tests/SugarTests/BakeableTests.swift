import Testing
import Foundation
import Sugar

@Suite
struct BakeableTests {
    @Test
    func init_catching_value() throws {
        let sut = Bakeable {
            42
        }

        #expect(try sut.get() == 42)
    }

    @Test
    func init_catching_error() {
        let sut = Bakeable {
            throw SomeError()
        }

        #expect(throws: SomeError.self) {
            try sut.get()
        }
    }

    @Test
    func decode_baked_success() throws {
        let json = """
        {
            "step" : "first"
        }
        """

        let sut = try decode(from: json)

        #expect(try sut.step.get() == .first)
    }

    @Test
    func decode_baked_failure() throws {
        let json = """
        {
            "step" : "third"
        }
        """

        let sut = try decode(from: json)

        #expect {
            try sut.step.get()
        } throws: { error in
            error is DecodingError
        }
    }

    @Test
    func encode_success() throws {
        let actual = try encode(CodableValue(step: .baked(.first)))
        let expected = """
        {
          "step" : "first"
        }
        """

        #expect(actual == expected)
    }

    @Test
    func encode_failure() throws {
        let sut = CodableValue(step: .unknown(SomeError()))

        #expect(throws: SomeError.self) {
            try encode(sut)
        }
    }
}

private struct SomeError: Error {}

private struct CodableValue: Codable {
    enum Step: String, Codable {
        case first
        case second
    }

    let step: Bakeable<Step>
}

private func decode(from json: String) throws -> CodableValue {
    let data = try #require(json.data(using: .utf8))
    let decoder = JSONDecoder()
    let value = try decoder.decode(CodableValue.self, from: data)
    return value
}

private func encode(_ object: CodableValue) throws -> String {
    let encoder = JSONEncoder()
    encoder.outputFormatting = [.sortedKeys, .prettyPrinted]
    let data = try encoder.encode(object)
    let string = String(data: data, encoding: .utf8)
    return try #require(string)
}
