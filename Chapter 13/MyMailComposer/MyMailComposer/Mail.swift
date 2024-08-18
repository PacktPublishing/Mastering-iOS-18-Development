import SwiftUI

struct Mail: Identifiable {
    let id = UUID()
    let sender: String
    let subject: String
    let body: String
}
