//
// Created by aschulz on 03.06.16.
//

import Foundation
import Gtk


class SWGtkApplication {
    var cptr: UnsafeMutablePointer<GtkApplication>
    var signalMap = [String: [() -> Void]]()

    init(applicationID: String, applicationFlag: SWGApplicationFlags) {
        cptr = gtk_application_new(applicationID, applicationFlag.rawValue)
    }

    deinit {
        g_object_unref(cptr)
    }

    func run() {
        var argv = Process.arguments.map {
            strdup($0)
        }

        g_application_run(unsafeBitCast(cptr, to: UnsafeMutablePointer<GApplication>.self), Process.argc, &argv)

        for ptr in argv {
            free(ptr)
        }
    }

    func connect(signal: String, callback: () -> Void) {
        func _activate(sender: UnsafeMutablePointer<Void>, data: UnsafeMutablePointer<Void>) {
            let myself = Unmanaged<SWGtkApplication>.fromOpaque(data).takeUnretainedValue()
            print(myself)
        }
        let _functor: @convention(c) (UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>) -> Void = _activate.self
        let _GCallback = unsafeBitCast(_functor, to: GCallback.self)
        g_signal_connect_data(cptr, signal, _GCallback, unsafeBitCast(unsafeAddress(of: self), to: UnsafeMutablePointer<Void>.self), nil, SWGConnectFlags.None.rawValue)
    }
}