import Foundation

public extension String {
    func trimmed(_ set: CharacterSet = .whitespaces) -> String {
        trimmingCharacters(in: set)
    }

    func nilify() -> String? {
        isEmpty ? nil : self
    }

    var isBlank: Bool {
        isEmpty || allSatisfy(\.isWhitespace)
    }
}
