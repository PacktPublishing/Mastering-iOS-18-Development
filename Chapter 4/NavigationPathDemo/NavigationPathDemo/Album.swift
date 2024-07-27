import Foundation

struct Album: Identifiable, Hashable {
    let id = UUID()
    let title: String
}
