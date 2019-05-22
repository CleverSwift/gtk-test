// swift-tools-version:4.2

import PackageDescription

#if os(OSX)
    let gtk = "https://github.com/Longhanks/gtk-modulemap-mac"
#elseif os(Linux)
    let gtk = "https://github.com/Longhanks/gtk-modulemap-linux"
#else
    fatalError("No gtk modulemap!")
#endif

let package = Package(
    name: "gtk-test",
    dependencies: [
        .package(url: gtk, .branch("master"))
    ],
    targets: [
        .target(name: "gtk-test")
    ]
)
