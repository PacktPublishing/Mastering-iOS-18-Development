import SwiftUI
import AppIntents
import UniformTypeIdentifiers
import CoreTransferable

struct Book {
    
}


struct Task: Identifiable, Codable, AppEntity {
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation { .init(stringLiteral: "Task") }
    
    init(id: UUID = UUID(), title: String, description: String = "") {
        self.id = id
        self.title = title
        self.description = description
    }
    
    var displayRepresentation: DisplayRepresentation { DisplayRepresentation(stringLiteral: "title: \(title)") }

    let id: UUID
    
    @Property(title: "Title")
    var title: String
    
    @Property(title:"Description")
    var description: String
    
                        
    static var defaultQuery = TaskQuery()
    
    func asRTF() -> Data? {
        
        // Create a mutable attributed string to hold the colored text
        let attributedString = NSMutableAttributedString()
        
        // Define the red color to apply to the entire text
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.red,
            .font: UIFont.systemFont(ofSize: 18)
        ]
        
        // Create an attributed string for the title with the red color
        let attributedTitle = NSAttributedString(string: title, attributes: attributes)
        
        // Append the attributed title to the mutable attributed string
        attributedString.append(attributedTitle)
        
        
        // Convert the attributed string to RTF data
        if let rtfData = try? attributedString.data(from: NSRange(location: 0, length: attributedString.length), documentAttributes: [.documentType: NSAttributedString.DocumentType.rtf, .characterEncoding: String.Encoding.utf8]) {
            return rtfData
        } else {
            return nil
        }
    }


}

struct TaskQuery: EntityQuery {
    func entities(for identifiers: [UUID]) async throws -> [Task] {
        return TaskManager.shared.tasks.filter {identifiers.contains($0.id)}
    }
    
    func suggestedEntities() async throws -> [Task] {
        return TaskManager.shared.tasks
    }
}



extension Task: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(description)
    }
    
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Task: Transferable {
    
    static var transferRepresentation: some TransferRepresentation {
        DataRepresentation(exportedContentType: .rtf) { task in
            task.asRTF()!
        }

        ProxyRepresentation(exporting: \.title)
    }
}
