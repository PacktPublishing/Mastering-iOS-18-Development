struct Book {
    var title: String
    var author: String
    var year: Int
    var genre: String
    var id: String
    
    static let List = [Book(title: "To Kill a Mockingbird", author: "Harper Lee", year: 1960, genre: "Fiction", id: "1"),
                       Book(title: "1984", author: "George Orwell", year: 1949, genre: "Dystopian", id:"2"),
                       Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald", year: 1925, genre: "Novel", id:"3"),
                       Book(title: "Sailboarding", author: "Watley Piper", year: 1925, genre: "Novel", id:"4")]
}
