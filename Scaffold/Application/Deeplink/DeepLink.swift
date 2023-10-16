import Foundation

enum DeepLinkError: LocalizedError {
    case generalError

    var errorDescription: String? {
        switch self {
        case .generalError:
            return "Couldn't create deep link"
        }
    }
}

enum DeepLink {
    case settings

    init(url: URL) throws {
        // very naive deeplinking
        // please implement a better one in your app
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
              components.host == "settings"
        else {
            throw DeepLinkError.generalError
        }

        self = .settings
    }
}
