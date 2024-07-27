import SwiftUI

struct Song: Identifiable, Hashable {
    let id = UUID()
    let title: String
}
