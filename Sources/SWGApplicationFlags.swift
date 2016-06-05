//
// Created by aschulz on 03.06.16.
//

import Foundation
import Gtk


struct SWGApplicationFlags : OptionSet {
    let rawValue : GApplicationFlags

    init(rawValue: GApplicationFlags) {
        self.rawValue = rawValue
    }

    init() {
        rawValue = G_APPLICATION_FLAGS_NONE
    }
    mutating func formUnion(_ other: SWGApplicationFlags) {}
    mutating func formIntersection(_ other: SWGApplicationFlags) {}
    mutating func formSymmetricDifference(_ other: SWGApplicationFlags) {}

    static let None = SWGApplicationFlags(rawValue: G_APPLICATION_FLAGS_NONE)
    static let IsService = SWGApplicationFlags(rawValue: G_APPLICATION_IS_SERVICE)
    static let IsLauncher = SWGApplicationFlags(rawValue: G_APPLICATION_IS_LAUNCHER)
    static let HandlesOpen = SWGApplicationFlags(rawValue: G_APPLICATION_HANDLES_OPEN)
    static let HandlesCommandLine = SWGApplicationFlags(rawValue: G_APPLICATION_HANDLES_COMMAND_LINE)
    static let SendEnvironment = SWGApplicationFlags(rawValue: G_APPLICATION_SEND_ENVIRONMENT)
    static let NonUnique = SWGApplicationFlags(rawValue: G_APPLICATION_NON_UNIQUE)
    #if os(Linux)
        static let CanOverrideAppId = SWGApplicationFlags(rawValue: G_APPLICATION_CAN_OVERRIDE_APP_ID)
    #endif
}

extension GApplicationFlags: IntegerLiteralConvertible {
    public typealias IntegerLiteralType = Int

    public init(integerLiteral: IntegerLiteralType) {
        self.init(UInt32(integerLiteral))
    }
}
