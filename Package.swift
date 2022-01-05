// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftPackageManager-Example",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v10),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SwiftPackageManager-Example",
            targets: ["SwiftPackageManager-Example"]),
        .library(
            name: "KakaoSDKAuth",
            targets: ["KakaoSDKAuth"]
        ),
        .library(
            name: "KakaoSDKCommon",
            targets: ["KakaoSDKCommon"]
        ),
        .library(
            name: "KakaoSDKLink",
            targets: ["KakaoSDKLink"]
        ),
        .library(
            name: "KakaoSDKTemplate",
            targets: ["KakaoSDKTemplate"]
        ),
        .library(
            name: "KakaoSDKUser",
            targets: ["KakaoSDKUser"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(
            url: "https://github.com/ReactiveX/RxSwift",
            .exact("6.1.0")
        ),
        .package(
            url: "https://github.com/Alamofire/Alamofire.git",
            .upToNextMajor(from:"5.0.0")
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwiftPackageManager-Example",
            dependencies: []
        ),
        .testTarget(
            name: "SwiftPackageManager-ExampleTests",
            dependencies: ["SwiftPackageManager-Example"]
        ),
        .target(
            name: "KakaoSDKAuth",
            dependencies: ["KakaoSDKCommon", "Alamofire"],
            path: "KakaoSDK/KakaoSDKAuth",
            exclude: ["KakaoSDKAuth-Info.plist"]
        ),
        .target(
            name: "KakaoSDKCommon",
            dependencies: [],
            path: "KakaoSDK/KakaoSDKCommon",
            exclude: ["KakaoSDKCommon-Info.plist"]
        ),
        .target(
            name: "KakaoSDKLink",
            dependencies: ["KakaoSDKCommon", "KakaoSDKTemplate", "Alamofire"],
            path: "KakaoSDK/KakaoSDKLink",
            exclude: ["KakaoSDKLink-Info.plist"]
        ),
        .target(
            name: "KakaoSDKTemplate",
            dependencies: ["KakaoSDKCommon", "Alamofire"],
            path: "KakaoSDK/KakaoSDKTemplate",
            exclude: ["KakaoSDKTemplate-Info.plist"]
        ),
        .target(
            name: "KakaoSDKUser",
            dependencies: [],
            path: "KakaoSDK/KakaoSDKUser",
            exclude: ["KakaoSDKUser-Info.plist"]
        ),
    ]
)
