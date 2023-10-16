import Foundation
import SwiftUI

protocol Widget: Identifiable, View {
    var type: WidgetType { get }
    var id: String { get }
}
