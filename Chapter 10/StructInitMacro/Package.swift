// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "StructInitMacro",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "StructInitMacro",
            targets: ["StructInitMacro"]
        ),
        .executable(
            name: "StructInitMacroClient",
            targets: ["StructInitMacroClient"]
        ),
    ],
    dependencies: [
        // Depend on the latest Swift 5.9 prerelease of SwiftSyntax
        .package(url: "https://github.com/apple/swift-syntax.git", branch: "main")
//        .package(path: "https://github.com/apple/swift-syntax.git")
//        .package(url: "https://github.com/apple/swift-syntax.git", from: "508.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        // Macro implementation that performs the source transformation of a macro.
        .macro(
            name: "StructInitMacroMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),

        // Library that exposes a macro as part of its API, which is used in client programs.
        .target(name: "StructInitMacro", dependencies: ["StructInitMacroMacros"]),

        // A client of the library, which is able to use the macro in its own code.
        .executableTarget(name: "StructInitMacroClient", dependencies: ["StructInitMacro"]),

        // A test target used to develop the macro implementation.
        .testTarget(
            name: "StructInitMacroTests",
            dependencies: [
                "StructInitMacroMacros",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]
        ),
    ]
)
