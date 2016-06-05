//
// Created by aschulz on 03.06.16.
//

import Foundation
import Gtk


class SWGtkApplication: SWGApplication {
    var ptrGtkApplication: UnsafeMutablePointer<GtkApplication>
    var windows = [SWGtkWindow]()

    override init(id: String, flag: SWGApplicationFlags) {
        ptrGtkApplication = gtk_application_new(id, flag.rawValue)
        super.init(unsafeBitCast(ptrGtkApplication, to: UnsafeMutablePointer<GApplication>.self))
    }

    deinit {
        g_object_unref(ptrGtkApplication)
    }
}