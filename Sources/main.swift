//
// Created by aschulz on 04.05.16.
//

import Gtk


func helloWorld(widget: UnsafeMutablePointer<GtkWidget>, data: UnsafeMutablePointer<Void>) {
    print("Hello, world!")
}

func activate(sender: UnsafeMutablePointer<Void>, data: UnsafeMutablePointer<Void>) {
    let app = unsafeBitCast(sender, to: UnsafeMutablePointer<GtkApplication>.self)
    let window = gtk_application_window_new(app)
    let windowPointer = unsafeBitCast(window, to: UnsafeMutablePointer<GtkWindow>.self)
    let widgetPointer = unsafeBitCast(window, to: UnsafeMutablePointer<GtkWidget>.self)
    gtk_window_set_title(windowPointer, "GTK Swift")
    gtk_window_set_default_size(windowPointer, 200, 200)

    // Container
    let buttonBox = gtk_button_box_new(GTK_ORIENTATION_HORIZONTAL)
    gtk_container_add (unsafeBitCast(windowPointer, to: UnsafeMutablePointer<GtkContainer>.self), buttonBox);

    // Button
    let button = gtk_button_new_with_label("Hello World");

    // Callback on button click
    let functorHelloWorld: @convention(c) (UnsafeMutablePointer<GtkWidget>, UnsafeMutablePointer<Void>) -> Void = helloWorld.self
    let callbackHelloWorld = unsafeBitCast(functorHelloWorld, to: GCallback.self)
    g_signal_connect_data(button, "clicked", callbackHelloWorld, nil, nil, G_CONNECT_SWAPPED)

    // Another callback on button click
    let functorDestroy: @convention(c) (UnsafeMutablePointer<GtkWidget>!) -> Void = gtk_widget_destroy.self
    let callbackDestroy = unsafeBitCast(functorDestroy, to: GCallback.self)
    g_signal_connect_data(button, "clicked", callbackDestroy, window, nil, G_CONNECT_SWAPPED);

    // add button to button box
    gtk_container_add (unsafeBitCast(buttonBox, to: UnsafeMutablePointer<GtkContainer>.self), button);

    // show window
    gtk_widget_show_all(widgetPointer)
}

func activate_headerbar(sender: UnsafeMutablePointer<Void>, data: UnsafeMutablePointer<Void>) {
    let app = unsafeBitCast(sender, to: UnsafeMutablePointer<GtkApplication>.self)
    let window = unsafeBitCast(gtk_application_window_new(app), to: UnsafeMutablePointer<GtkWindow>.self)
    gtk_window_set_default_size(window, 600, 400)

    let headerBar = unsafeBitCast(gtk_header_bar_new(), to: UnsafeMutablePointer<GtkHeaderBar>.self)
    gtk_header_bar_set_show_close_button(headerBar, 1)
    gtk_header_bar_set_title(headerBar, "Hello World!")
    gtk_header_bar_set_has_subtitle(headerBar, 0);

    let button = gtk_button_new()
    let icon = g_themed_icon_new("mail-send-receive-symbolic")
    let image = gtk_image_new_from_gicon(icon, GTK_ICON_SIZE_BUTTON)
    g_object_unref(unsafeBitCast(icon, to: UnsafeMutablePointer<Void>.self))
    gtk_container_add(unsafeBitCast(button, to: UnsafeMutablePointer<GtkContainer>.self), image)
    gtk_header_bar_pack_end(headerBar, button)

    let box = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0)
    gtk_style_context_add_class(gtk_widget_get_style_context(box), "linked")
    let arrowLeftButton = gtk_button_new()
    let arrowLeftIcon = g_themed_icon_new("pan-start-symbolic")
    let arrowLeftImage = gtk_image_new_from_gicon(arrowLeftIcon, GTK_ICON_SIZE_BUTTON)
    g_object_unref(unsafeBitCast(arrowLeftIcon, to: UnsafeMutablePointer<Void>.self))
    gtk_container_add(unsafeBitCast(arrowLeftButton, to: UnsafeMutablePointer<GtkContainer>.self), arrowLeftImage)
    gtk_container_add(unsafeBitCast(box, to: UnsafeMutablePointer<GtkContainer>.self), arrowLeftButton)
    let arrowRightButton = gtk_button_new()
    let arrowRightIcon = g_themed_icon_new("pan-end-symbolic")
    let arrowRightImage = gtk_image_new_from_gicon(arrowRightIcon, GTK_ICON_SIZE_BUTTON)
    g_object_unref(unsafeBitCast(arrowRightIcon, to: UnsafeMutablePointer<Void>.self))
    gtk_container_add (unsafeBitCast(arrowRightButton, to: UnsafeMutablePointer<GtkContainer>.self), arrowRightImage)
    gtk_container_add (unsafeBitCast(box, to: UnsafeMutablePointer<GtkContainer>.self), arrowRightButton)
    gtk_header_bar_pack_start(headerBar, box);

    gtk_window_set_titlebar(window, unsafeBitCast(headerBar, to: UnsafeMutablePointer<GtkWidget>.self))
    gtk_widget_show_all(unsafeBitCast(window, to: UnsafeMutablePointer<GtkWidget>.self))
}


let c_functor: @convention(c) (UnsafeMutablePointer<Void>, UnsafeMutablePointer<Void>) -> Void = activate_headerbar.self
let g_callback = unsafeBitCast(c_functor, to: GCallback.self)
let app = SWGtkApplication(applicationID: "de.aschulz.test", applicationFlag: .None)
app.connect(signal: "activate") {
    print("lol")
}
//g_signal_connect_data(app.cptr, "activate", g_callback, nil, nil, G_CONNECT_AFTER)
app.run()