import Common
import Foundation

final class PinCodeViewModel: ObservableObject {
    func validatePinCode() {
        pincodeAuthorizedSubject.send(true)
    }
}
