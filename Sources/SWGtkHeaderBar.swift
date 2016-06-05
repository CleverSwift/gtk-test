//
// Created by Andreas Schulz on 04.06.16.
//

import Foundation
import Gtk


class SWGtkHeaderBar: SWGtkContainer {
    var ptrGtkHeaderBar: UnsafeMutablePointer<GtkHeaderBar>

    var hasSubtitle: Bool {
        get {
            switch gtk_header_bar_get_has_subtitle(ptrGtkHeaderBar) {
                case 1 :
                    return true
                default:
                    return false
            }
        }

        set {
            if newValue {
                gtk_header_bar_set_has_subtitle(ptrGtkHeaderBar, 1)
            }
            else {
                gtk_header_bar_set_has_subtitle(ptrGtkHeaderBar, 0)
            }
        }
    }

    var showCloseButton: Bool {
        get {
            switch gtk_header_bar_get_show_close_button(ptrGtkHeaderBar) {
                case 1:
                    return true
                default:
                    return false
            }
        }

        set {
            if newValue {
                gtk_header_bar_set_show_close_button(ptrGtkHeaderBar, 1)
            }
            else {
                gtk_header_bar_set_show_close_button(ptrGtkHeaderBar, 0)
            }
        }
    }

    var title: String? {
        get {
            if let something = gtk_header_bar_get_title(ptrGtkHeaderBar) {
                return String(cString: something)
            }
            return nil
        }

        set {
            gtk_header_bar_set_title(ptrGtkHeaderBar, newValue)
        }
    }

    init() {
        ptrGtkHeaderBar = unsafeBitCast(gtk_header_bar_new(), to: UnsafeMutablePointer<GtkHeaderBar>.self)
        super.init(unsafeBitCast(ptrGtkHeaderBar, to: UnsafeMutablePointer<GtkContainer>.self))
    }

    func packStart(_ widget: SWGtkWidget) {
        widgets.append(widget)
        gtk_header_bar_pack_start(ptrGtkHeaderBar, widget.ptrGtkWidget)
    }

    func packEnd(_ widget: SWGtkWidget) {
        widgets.append(widget)
        gtk_header_bar_pack_end(ptrGtkHeaderBar, widget.ptrGtkWidget)
    }
}
