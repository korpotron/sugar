import Foundation
import Sugar
import Testing

@Suite
struct SnakeCaseFormatStyleTests {
    @Test
    func simple() throws {
        #expect("hello world".formatted(.snakeCase) == "hello_world")
    }

    @Test
    func simple_capitalized() throws {
        #expect("Hello World".formatted(.snakeCase) == "hello_world")
    }

    @Test
    func simple_some_underscores() throws {
        #expect("Lorem   Ipsum  DOLOR".formatted(.snakeCase) == "lorem_ipsum_d_o_l_o_r")
    }
}
