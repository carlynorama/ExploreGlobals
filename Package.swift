// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ExploreGlobals",
    platforms: [
        .macOS(.v15), .iOS(.v18)
    ],
    products: [
        .executable(name: "clobal", targets: ["ExploreGlobals"])
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "ExploreGlobals",
            dependencies: ["BackingC"],
            //no not a swift setting 
            // swiftSettings: [ .unsafeFlags(["-fapi-notes-modules"])]
        ),
        .testTarget(
            name: "ExploreGlobalsTests",
            dependencies: ["ExploreGlobals"]
        ),

        .target(
            name: "BackingC",
            cSettings: [
                .unsafeFlags(["-fapinotes-modules"])
            ]
        )
    ]
)
