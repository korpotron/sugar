import Foundation

public extension Clock {
    static func travel(_ initial: Date) -> (Clock, TimeMachine) {
        let machine = TimeMachine(date: initial)
        let clock = Clock.of {
            machine.date
        }

        return (clock, machine)
    }
}
