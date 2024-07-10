import Foundation
import SwiftData

@Model
class Book {
    
    #Unique<Book>([\.name, \.publicationName])
    #Index<Book>([\.name], [\.name, \.publicationName])
    
    var publicationName: String = "Packt"
    var name: String
    var subtitle: String
    
    init(publicationName: String, name: String, subtitle: String) {
        self.publicationName = publicationName
        self.name = name
        self.subtitle = subtitle
    }
}

enum MyMigrationPlan: SchemaMigrationPlan {
    static var schemas: [VersionedSchema.Type] {
        [BookSchemaV1.self, BookSchemaV2.self, BookSchemaV3.self]
    }
    
    static var stages: [MigrationStage] {
        [migrateV1toV2, migrateV2toV3]
    }
    
    static let migrateV1toV2 = MigrationStage.lightweight(fromVersion: BookSchemaV1.self, toVersion: BookSchemaV2.self)
    static let migrateV2toV3 = MigrationStage.custom(fromVersion: BookSchemaV2.self, toVersion: BookSchemaV3.self, willMigrate: { context in
        if let books = try? context.fetch(FetchDescriptor<Book>()) {
            for book in books {
                let newName = book.name + " " + book.subtitle
                book.name = newName
            }
        }
        try? context.save()
    }, didMigrate: nil)
}

enum BookSchemaV1: VersionedSchema {
    static var versionIdentifier: Schema.Version
    {
        return .init(1, 0, 0)
    }
    
    static var models: [any PersistentModel.Type] {
        [Book.self]
    }
    
    @Model class Book {
        var name: String
        
        init(name: String) {
            self.name = name
        }
    }
}

enum BookSchemaV2: VersionedSchema {
    static var versionIdentifier: Schema.Version
    {
        return .init(1, 1, 0)
    }
    
    static var models: [any PersistentModel.Type] {
        [Book.self]
    }
    
    @Model class Book {
        var publicationName: String = "Packt"
        var name: String
        
        init(publicationName: String, name: String) {
            self.publicationName = publicationName
            self.name = name
        }
    }
}

enum BookSchemaV3: VersionedSchema {
    static var versionIdentifier: Schema.Version
    {
        return .init(1, 2, 0)
    }
    
    static var models: [any PersistentModel.Type] {
        [Book.self]
    }
    
    @Model class Book {
        var name: String
        
        init(name: String) {
            self.name = name
        }
    }
}
