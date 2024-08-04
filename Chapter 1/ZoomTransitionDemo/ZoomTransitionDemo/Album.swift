struct Album: Identifiable {
    let name: String
    let imageName: String
    let id: String
    
    static let albums: [Album] = [
        Album(name: "Echoes of the Past", imageName: "image1", id: "1"),
        Album(name: "Riptide Reverie", imageName: "image2", id: "2"),
        Album(name: "Desert Winds", imageName: "image3", id: "3"),
        Album(name: "Anchored in Time", imageName: "image4", id: "4"),
    ]
}
