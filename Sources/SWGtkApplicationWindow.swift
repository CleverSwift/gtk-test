//
// Created by Andreas Schulz on 04.06.16.
//

import Foundation
import Gtk


class SWGtkApplicationWindow: SWGtkWindow {
    var ptrGtkApplicationWindow: UnsafeMutablePointer<GtkApplicationWindow>

    init(app: SWGtkApplication) {
        ptrGtkApplicationWindow = unsafeBitCast(gtk_application_window_new(app.ptrGtkApplication), to: UnsafeMutablePointer<GtkApplicationWindow>.self)
        super.init(unsafeBitCast(ptrGtkApplicationWindow, to: UnsafeMutablePointer<GtkWindow>.self))
    }
}
