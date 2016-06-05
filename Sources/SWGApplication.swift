//
// Created by Andreas Schulz on 04.06.16.
//

import Foundation
import Gtk


class SWGApplication: SWGObject {
    var ptrGApplication: UnsafeMutablePointer<GApplication>

    init(id: String, flag: SWGApplicationFlags) {
        ptrGApplication = g_application_new(id, flag.rawValue)
        super.init(unsafeBitCast(ptrGApplication, to: UnsafeMutablePointer<Void>.self))
    }

    init(_ ptr: UnsafeMutablePointer<GApplication>) {
        ptrGApplication = ptr
        super.init(unsafeBitCast(ptrGApplication, to: UnsafeMutablePointer<Void>.self))
    }

    func run() {
        var argv = Process.arguments.map {
            strdup($0)
        }

        g_application_run(ptrGApplication, Process.argc, &argv)

        for ptr in argv {
            free(ptr)
        }
    }
}
