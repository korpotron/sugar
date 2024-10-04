import Sugar
import Testing

@Suite
struct ArrayTests {
    private func prepare() -> [Animal] {
        [
            Cat(name: "Kitty"),
            Dog(name: "Buddy"),
            Cat(name: "Mia"),
            Dog(name: "Fido"),
            Cat(name: "Tiger")
        ]
    }

    @Test
    func first_of_success() throws {
        let sut = prepare()
        #expect(sut.first(of: Cat.self)?.name == "Kitty")
        #expect(sut.first(of: Dog.self)?.name == "Buddy")
    }

    @Test
    func first_of_failure() throws {
        let sut = prepare()
        #expect(sut.first(of: Snake.self) == nil)
    }
}

private protocol Animal {}

private struct Dog: Animal {
    let name: String
}

private struct Cat: Animal {
    let name: String
}


private struct Snake: Animal {
    let name: String
}
