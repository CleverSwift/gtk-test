//
// Created by aschulz on 04.05.16.
//

import Gtk

// Pointer to GtkApplication
let app = gtk_application_new("de.aschulz.test", G_APPLICATION_FLAGS_NONE)


// Demangle name to use as C function
let handler: @convention(c) (UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>) -> Void = { sender, data in
    let app = unsafeBitCast(sender, to: UnsafeMutablePointer<GtkApplication>.self)
    let window = gtk_application_window_new(app)
    let windowPointer = unsafeBitCast(window, to: UnsafeMutablePointer<GtkWindow>.self)
    let widgetPointer = unsafeBitCast(window, to: UnsafeMutablePointer<GtkWidget>.self)
    gtk_window_set_title(windowPointer, "GTK Swift")
    gtk_window_set_default_size(windowPointer, 200, 200)
    gtk_widget_show_all(widgetPointer)
}

// Get pointer to handler
let handlerAddress = unsafeBitCast(handler, to: GCallback.self)

g_signal_connect_data(app, "activate", handlerAddress, app, nil, G_CONNECT_AFTER)
g_application_run(UnsafeMutablePointer(app), 0, nil)
g_object_unref(app)