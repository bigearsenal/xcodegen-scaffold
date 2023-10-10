import Combine
import Foundation

public protocol DeeplinkManager {
    func manage(url: URL)
}

public class DeeplinkManagerImpl: DeeplinkManager {
    // MARK: - Properties

    private let subject = CurrentValueSubject<DeeplinkTarget?, Never>(nil)

    public init() {}

    public func manage(url: URL) {
        guard url.scheme == DeepLinkConstants.scheme,
              url.host == DeepLinkConstants.host,
              url.path == DeepLinkConstants.detailsPath,
              let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
              let queryItems = components.queryItems
        else {
            subject.send(nil)
            return
        }

        let query = queryItems.reduce(into: [String: String]()) { result, item in
            result[item.name] = item.value
        }

        guard let id = query[DeepLinkConstants.query] else {
            subject.send(nil)
            return
        }

        subject.send(.details(reference: id))
    }
}
