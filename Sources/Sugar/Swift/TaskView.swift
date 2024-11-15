import SwiftUI

public struct TaskView<ID: Equatable, Success: Sendable, Failure: Error, InitialView: View, SuccessView: View, FailureView: View>: View {
    private let id: ID
    private let priority: TaskPriority
    private let task: () async throws(Failure) -> Success
    private let success: (Success) -> SuccessView
    private let failure: (Failure) -> FailureView

    @State private var subview: Subview

    private enum Subview: View {
        case initial(InitialView)
        case success(SuccessView)
        case failure(FailureView)

        var body: some View {
            switch self {
            case let .initial(view) where view is EmptyView:
                ZStack {}
            case let .initial(view):
                view
            case let .success(view):
                view
            case let .failure(view):
                view
            }
        }
    }

    public init(
        id: ID = 0,
        priority: TaskPriority = .userInitiated,
        task: @escaping @Sendable () async throws(Failure) -> Success,
        @ViewBuilder initial: @escaping () -> InitialView,
        @ViewBuilder success: @escaping (_ value: Success) -> SuccessView,
        @ViewBuilder failure: @escaping (_ error: Failure) -> FailureView
    ) {
        self.id = id
        self.priority = priority
        self.task = task
        self.subview = .initial(initial())
        self.success = success
        self.failure = failure
    }

    public var body: some View {
        subview
            .task(id: id, priority: priority, action)
    }

    private func action() async  {
        do throws(Failure) {
            let value = try await task()
            subview = .success(success(value))
        } catch {
            subview = .failure(failure(error))
        }
    }
}

public extension TaskView where InitialView == ProgressView<EmptyView, EmptyView> {
    init(
        id: ID = 0,
        priority: TaskPriority = .userInitiated,
        task: @escaping @Sendable () async throws(Failure) -> Success,
        @ViewBuilder success: @escaping (_ value: Success) -> SuccessView,
        @ViewBuilder failure: @escaping (_ error: Failure) -> FailureView
    ) {
        self.init(
            id: id,
            priority: priority,
            task: task,
            initial: {
                ProgressView()
            },
            success: success,
            failure: failure
        )
    }
}

#Preview {
    TaskView {
        try await Task.sleep(for: .seconds(2))
        return 42
    } success: { value in
        Text("success \(value)")
    } failure: { error in
        Text("error \(error)")
    }
}
