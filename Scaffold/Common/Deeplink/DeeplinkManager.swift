import Foundation

public class DeeplinkManager {
    public enum DeeplinkTarget: Equatable {
        case home
        case details(reference: String)
    }

    public enum DeepLinkConstants {
        static let scheme = "scaffolddl"
        static let host = "com.scaffolddl"
        static let detailsPath = "/details"
        static let query = "id"
    }

    public init() {}

    public func manage(url: URL) -> DeeplinkTarget {
        print(url)

        guard url.scheme == DeepLinkConstants.scheme,
              url.host == DeepLinkConstants.host,
              url.path == DeepLinkConstants.detailsPath,
              let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
              let queryItems = components.queryItems
        else { return .home }

        let query = queryItems.reduce(into: [String: String]()) { result, item in
            result[item.name] = item.value
        }

        guard let id = query[DeepLinkConstants.query] else { return .home }

        return .details(reference: id)
    }
}
