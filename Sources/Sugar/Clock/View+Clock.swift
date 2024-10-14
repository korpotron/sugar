import SwiftUI

public extension EnvironmentValues {
    private struct ClockKey: EnvironmentKey {
        static var defaultValue: Clock {
            .system
        }
    }

    var clock: Clock {
        get {
            self[ClockKey.self]
        }
        set {
            self[ClockKey.self] = newValue
        }
    }
}

public extension View {
    @inlinable nonisolated func clock(_ clock: Clock) -> some View {
        environment(\.clock, clock)
    }
}

#Preview {
    struct Example: View {
        @Environment(\.clock) var clock

        var body: some View {
            TimelineView(.everySecond) { ctx in
                Text(clock.now.formatted(.iso8601))
            }
        }
    }

    struct Developer: View {
        @State var value = 0

        let clock: Clock

        @ObservedObject
        var timemachine: TimeMachine

        init() {
            (clock, timemachine) = Clock.travel(.distantPast)
        }

        var body: some View {
            VStack {
                Example()
                    .clock(clock)
                VStack {
                    Text("clock: \(clock.now.formatted(.iso8601))")
                    Text("value: \(value)")
                    Stepper("Date", value: $value)
                        .onChange(of: value) { value in
                            timemachine.jump(to: .distantPast.addingTimeInterval(TimeInterval(value)))
                        }
                }
                .font(.footnote)
                .padding()
            }
        }
    }

    return Developer()
}
