import Foundation
import Sugar
import Testing

@Suite
struct StringTests {
    @Test
    func trimmed_bar() throws {
        #expect("barfoorab".trimmed(.bar) == "foo")
    }

    @Test
    func trimmed_spaces() throws {
        #expect("  foobar  ".trimmed() == "foobar")
    }

    @Test
    func nilify_empty() {
        #expect("".nilify() == nil)
    }

    @Test
    func nilify_non_empty() {
        #expect("foo".nilify() != nil)
    }

    @Test
    func isBlank_on_blank1() {
        #expect("".isBlank == true)
    }

    @Test
    func isBlank_on_blank2() {
        #expect("    ".isBlank == true)
    }

    @Test
    func isBlank_on_non_blank() {
        #expect("  xxx  ".isBlank == false)
    }
}

private extension CharacterSet {
    static let bar = CharacterSet(charactersIn: "bar")
}
