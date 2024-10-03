//import SwiftSyntax
//import SwiftSyntaxMacrosTestSupport
//import XCTest
////import StructInitMacroMacros
//import StructInitMacro
//import SwiftSyntaxMacros
//
//let testMacros: [String: Macro.Type] = [
//    "StructInit": StructInitMacro.self,
//]
//
//final class struct_initial_macroTests: XCTestCase {
//    func testMacro() {        
//        assertMacroExpansion(
//            """
//            @StructInit
//            struct Book {
//                var id: Int
//                var title: String
//                var subtitle: String
//                var description: String
//                var author: String
//            }
//            """,
//            expandedSource:
//            """
//            
//            struct Book {
//                var id: Int
//                var title: String
//                var subtitle: String
//                var description: String
//                var author: String
//            
//                init(id: Int, title: String, subtitle: String, description: String, author: String) {
//                    self.id = id
//                    self.title = title
//                    self.subtitle = subtitle
//                    self.description = description
//                    self.author = author
//                }
//            }
//            """,
////            macros: testMacros
//        )
//    }
//}
