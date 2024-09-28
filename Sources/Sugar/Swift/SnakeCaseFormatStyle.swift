import Foundation

public struct SnakeCaseFormatStyle: FormatStyle {
    public init() {}

    public func format(_ value: String) -> String {
        value.reduce(into: "") { result, character in
            func underscore() {
                if result.last != "_" {
                    result.append("_")
                }
            }

            if character.isUppercase {
                if !result.isEmpty {
                    underscore()
                }
                result.append(character.lowercased())
            } else if character.isWhitespace {
                underscore()
            } else {
                result.append(character)
            }
        }
    }
}

public extension FormatStyle where Self == SnakeCaseFormatStyle {
    static var snakeCase: Self {
        SnakeCaseFormatStyle()
    }
}
