import Common
import SwiftUI

struct DAppsWidgetView: View {
    @StateObject var viewModel: DAppsWidgetViewModel

    var body: some View {
        ScrollView {
            HStack {
                Spacer()
            }
            Grid {
                widgetRows
            }
            .background(
                GeometryReader { geo in
                    Image("wallpaper-2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: 2000)
                        .offset(y: -500)
                }.ignoresSafeArea()
            )
            .padding()
        }
        .navigationTitle("Home")
    }

    @ViewBuilder private var widgetRows: some View {
        let array = mapWidgetsToRows()

        ForEach(Array(zip(array.indices, array)), id: \.0) { _, widgets in
            GridRow {
                ForEach(widgets, id: \.id) { widget in
                    createWidget(widget)
                }
            }
        }
    }

    @ViewBuilder private func createWidget(_ widget: any Widget) -> some View {
        let view = widget.gridCellColumns(widget.type == .fullRow ? 2 : 1)
        AnyView(view)
//            // Draggable
//            .draggable(widget) {
//                // Custom preview view
//                RoundedRectangle(cornerRadius: 10)
//                    .fill(.ultraThinMaterial)
//                    .frame(width: 1, height: 1)
//                    .onAppear {
//                        draggingItem = widget
//                    }
//            }
    }

    // MARK: - Helpers

    private func mapWidgetsToRows() -> [[any Widget]] {
        Array(zip(viewModel.widgets.indices, viewModel.widgets))
            .reduce(into: [[any Widget]]()) { result, element in
                print(element.1.id)
                print(result)
                print("")

                // get last element in partialResult
                guard var lastElement = result.last else {
                    result += [[element.1]]
                    return
                }

                // if lastElement is full
                if lastElement.count == 2 {
                    // add next element
                    result += [[element.1]]
                    return
                }

                // lastElement.count == 1 (lastElement count can not be equal to 0) since `result += [[element.1]]`
                switch lastElement.last!.type {
                case .fullRow:
                    // spend entire rows showing this widget
                    result += [[element.1]]
                    return
                case .halfRow:
                    switch element.1.type {
                    case .halfRow:
                        // if current element is a halfRow
                        // add the element to the lastElement
                        lastElement.append(element.1)

                        // modify result
                        result[result.count - 1] = lastElement
                        return
                    case .fullRow:
                        // if currentElement is a fullRow, push it to the next row
                        result += [[element.1]]
                        return
                    }
                }
            }
    }
}

#Preview {
    NavigationStack {
        DAppsWidgetView(viewModel: .init(widgetsManager: MockWidgetsManager()))
    }
}
