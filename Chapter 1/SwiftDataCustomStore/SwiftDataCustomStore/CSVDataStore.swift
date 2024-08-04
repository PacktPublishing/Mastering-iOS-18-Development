import Foundation
import SwiftData

@available(swift 5.9) @available(macOS 15, iOS 18, tvOS 18, watchOS 11, visionOS 2, *)
final class CSVStoreConfiguration: DataStoreConfiguration {
   
    typealias Store = CSVDataStore
        
    var name: String
    var schema: Schema?
    var fileURL: URL
    
    init(name: String, schema: Schema? = nil, fileURL: URL) {
        self.name = name
        self.schema = schema
        self.fileURL = fileURL
    }
    
    static func == (lhs: CSVStoreConfiguration, rhs: CSVStoreConfiguration) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

final class CSVDataStore: DataStore {

    typealias Configuration = CSVStoreConfiguration
    typealias Snapshot = DefaultSnapshot
    
    var configuration: CSVStoreConfiguration
    var name: String
    var schema: Schema
    var identifier: String

    
    required init(_ configuration: CSVStoreConfiguration, migrationPlan: (any SchemaMigrationPlan.Type)?) throws {
        self.configuration = configuration
        self.name = configuration.name
        self.schema = configuration.schema!
        self.identifier = configuration.fileURL.lastPathComponent
    }
    
    func fetch<T>(_ request: DataStoreFetchRequest<T>) throws -> DataStoreFetchResult<T, DefaultSnapshot> where T : PersistentModel {
        
        let predicate = request.descriptor.predicate
        
        return DataStoreFetchResult(descriptor: request.descriptor, fetchedSnapshots: [], relatedSnapshots: [:])

    }
    
    func save(_ request: DataStoreSaveChangesRequest<DefaultSnapshot>) throws -> DataStoreSaveChangesResult<DefaultSnapshot> {
        var remappedIdentifiers = [PersistentIdentifier: PersistentIdentifier]()
        for snapshot in request.inserted {
            
        }
        for snapshot in request.updated {
            
        }
        for snapshot in request.deleted {
            
        }
        return DataStoreSaveChangesResult<DefaultSnapshot>(for: self.identifier,
                                                           remappedIdentifiers: remappedIdentifiers)
    }
    
}
