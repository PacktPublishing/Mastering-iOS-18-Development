import AppIntents

@AssistantIntent(schema: .mail.createDraft)
struct SendDraftIntent: AppIntent {
    
//    static var title: LocalizedStringResource { "Send new email" }

    
//    init() {
//        self.target = MailDraftEntity()
//    }
//    
    var account: MailAccountEntity?
    var attachments: [IntentFile]
//    
//    var target: MailDraftEntity
//    var sendLaterDate: Date?
    var to: [IntentPerson]
    var cc: [IntentPerson]
    var bcc: [IntentPerson]
    var subject: String?
//    @Parameter(title: "Body")
    var body: String?
    
    @MainActor
    func perform() async throws -> some ReturnsValue
    <MailDraftEntity>{
        let mailDraftEntity = MailDraftEntity(body: EntityProperty(title: LocalizedStringResource(stringLiteral: body!)))
        ComposeDraftManager.shared.isPresentingCompose = true
        return .result(value: mailDraftEntity)
    }
}
