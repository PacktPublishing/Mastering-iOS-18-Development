import Foundation

struct Album: Identifiable {
    let id = UUID()
    let title: String
    let artist: String
    let coverImage: String 
}
