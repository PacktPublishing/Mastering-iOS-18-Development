import AppIntents

@AssistantEntity(schema: .mail.draft)
struct MailDraftEntity {
    
    
    static var defaultQuery = Query()
    
    struct Query: EntityStringQuery {
        init() {}
        func entities(for identifiers: [MailDraftEntity.ID]) async throws -> [MailDraftEntity] { [] }
        func entities(matching string: String) async throws -> [MailDraftEntity] { [] }
    }
    
    var displayRepresentation: DisplayRepresentation { DisplayRepresentation(stringLiteral: "\(subject ?? "")") }
    
    let id = UUID()
        
    var to: [IntentPerson]
    var cc: [IntentPerson]
    var bcc: [IntentPerson]
    var subject: String?
    var body: String?
    var attachments: [IntentFile]
    var account: MailAccountEntity
}

@AssistantEntity(schema: .mail.account)
struct MailAccountEntity {
    let id = UUID()
    var emailAddress: String
    var name: String
    
    static var defaultQuery = AccountQuery()

    struct AccountQuery:EntityStringQuery {
        func entities(matching string: String) async throws -> [MailAccountEntity] {
            []
        }
        
        init() {}
        func entities(for identifiers: [MailAccountEntity.ID]) async throws -> [MailAccountEntity] {
            []
        }
        
    }
    
    var displayRepresentation: DisplayRepresentation { DisplayRepresentation(stringLiteral: name) }
}
