//
// Created by Andreas Schulz on 05.06.16.
//

import Foundation
import Gtk


class SWGtkWindow: SWGtkBin {
    var ptrGtkWindow: UnsafeMutablePointer<GtkWindow>
    var _titlebar: SWGtkWidget? = nil

    var title: String? {
        get {
            if let something = gtk_window_get_title(ptrGtkWindow) {
                return String(cString: something)
            }
            return nil
        }

        set {
            gtk_window_set_title(ptrGtkWindow, newValue)
        }
    }

    var titlebar: SWGtkWidget? {
        get {
            return _titlebar
        }
        set {
            if let widget = newValue {
                gtk_window_set_titlebar(ptrGtkWindow, widget.ptrGtkWidget)
            }
            else {
                gtk_window_set_titlebar(ptrGtkWindow, nil)
            }
            _titlebar = newValue
        }
    }

    init(_ ptr: UnsafeMutablePointer<GtkWindow>) {
        ptrGtkWindow = ptr
        super.init(unsafeBitCast(ptrGtkWindow, to: UnsafeMutablePointer<GtkBin>.self))
    }

    func setDefaultSize(width: Int32 = 600, height: Int32 = 400) {
        gtk_window_set_default_size(ptrGtkWindow, width, height)
    }
}
