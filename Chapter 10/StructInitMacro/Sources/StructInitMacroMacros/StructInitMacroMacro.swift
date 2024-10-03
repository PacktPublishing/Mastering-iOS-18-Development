import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

enum StructInitError: CustomStringConvertible, Error {
    case onlyApplicableToStruct
    
    var description: String {
        switch self {
        case .onlyApplicableToStruct: return "@StructInit can only be applied to a structure"
        }
    }
}

public struct StructInitMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [SwiftSyntax.DeclSyntax] {
        
        guard let structDecl = declaration.as(StructDeclSyntax.self) else {
            throw StructInitError.onlyApplicableToStruct
        }
        
        let members = structDecl.memberBlock.members
        let variableDecl = members.compactMap { $0.decl.as(VariableDeclSyntax.self) }
        let variablesName = variableDecl.compactMap { $0.bindings.first?.pattern }
        let variablesType = variableDecl.compactMap { $0.bindings.first?.typeAnnotation?.type }
    
        
        let initializer = try InitializerDeclSyntax(StructInitMacro.generateInitialCode(variablesName: variablesName, variablesType: variablesType)) {
            for name in variablesName {
                ExprSyntax("self.\(name) = \(name)")
            }
        }
        
            
        let initSyntax = try InitializerDeclSyntax("init(title: String)") {
            "self.title = title"
        }
        
        return [DeclSyntax(initializer)]
    }
    
    public static func generateInitialCode(variablesName: [PatternSyntax],
                                           variablesType: [TypeSyntax]) -> SyntaxNodeString {
        var initialCode: String = "init("
        for (name, type) in zip(variablesName, variablesType) {
            initialCode += "\(name): \(type), "
        }
        initialCode = String(initialCode.dropLast(2))
        initialCode += ")"
                              
        return SyntaxNodeString(stringLiteral: initialCode)
    }
}

@main
struct struct_initial_macroPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        StructInitMacro.self,
    ]
}
