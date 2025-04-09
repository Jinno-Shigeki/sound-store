// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Note",
    platforms: [.iOS(.v18)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "NotePresentation",
            targets: ["NotePresentation"])
    ],
    dependencies: [
        .package(name: "Recorder", path: "../Recorder")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        // NotePresentationモジュール（Presentationフォルダを含む）
        .target(
            name: "NotePresentation",
            dependencies: [
                "NoteViewModel",
                .product(name: "RecorderPresentation", package: "Recorder")
            ],
            path: "Sources/Note/Presentation"
        ),
        .target(
            name: "NoteViewModel",
            dependencies: ["NoteModel"],
            path: "Sources/Note/ViewModel"
        ),
        .target(
            name: "NoteModel",
            path: "Sources/Note/Model"
        ),
        .testTarget(
            name: "NoteTests",
            dependencies: ["NotePresentation"]
        ),
    ]
)
